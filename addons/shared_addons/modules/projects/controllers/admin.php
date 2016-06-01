<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Brayan Acebo
 */
// Ajustamos Zona Horaria
date_default_timezone_set("America/Bogota");

class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('projects');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "project_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1, $ordering = 0) {
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // Paginación de projectos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('projects')
                        ->where('lang', $lang_admin)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/projects/index/' . $lang_admin, $count_all, (empty($ordering) ? 10 : 100000000), 4);
        $search = '';

        // consulta de los projectos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('projects AS pr')
                ->order_by('position', 'ASC')
                ->where('lang', $lang_admin);

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los projectos
            $search = $_POST['shearch'];
            $search = explode(' ', $search);
            if (!empty($search) && count($search) > 1) {
                $first = FALSE;
                foreach ($search AS $item) {
                    if ($first) {
                        $this->db->like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                        $first = TRUE;
                    } else {
                        $this->db->or_like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                    }
                }
            } else {
                $this->db->like('pr.name', $_POST['shearch']);
                $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $_POST['shearch']);
            }
        } else {
            if (!$ordering) {
                $this->db->limit($pagination['limit'], $pagination['offset']);
            }
        }

        // traemos los datos
        $projects = $this->db->get()->result();

        if (!empty($projects)) {
            foreach ($projects AS $item) {
                $item->price = (!empty($item->price)) ? "$" . number_format($item->price) : null;
            }
        }

        // Intro
        $intro = $this->db->where('lang', $lang_admin)->get('projects_intro')->result();
        $intro = $intro[0];

        // categorias con sortable (se consultan con un orden)
        $structure_categories = $this->db
                        ->where('lang', $lang_admin)
                        ->order_by('position', 'ASC')
                        ->get('project_categories')->result();

        // se contruye el html de las categorias
        $structure_categories = $this->project_model->build_categories($structure_categories, 'projects', 0, true, null, $lang_admin);

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('projects', $projects)
                ->set('intro', $intro)
                ->set('ordering', $ordering)
                ->set('structure_categories', $structure_categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }
    
    /*
     * projectos
     */
    
        public function create($lang_admin = 'es') {
        // cargamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('project_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    public function store($lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('category', 'Categoría', 'required|trim');
        $this->form_validation->set_rules('content', 'Descripción', 'required|trim');
        $this->form_validation->set_rules('introduction', 'Introducción', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'seefile' => ($post->seefile == "on") ? 1 : 0,
                'introduction' => $post->introduction,
                'category' => $post->category,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/projects';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'projects/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/projects/');
                }
            }
            
            // Archivo
            $file = $_FILES['file']['name'];

            if (!empty($file)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'projects/' . $datos['upload_data']['file_name'];
                    $file = array('file' => $path);
                    $data = array_merge($data, $file);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/projects/');
                }
            }

            // Se inserta en la base de datos
            if ($this->db->insert('projects', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/projects/index/' . $lang_admin . '/');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/projects/create/' . $lang_admin);
        }
    }

    public function destroy($id = null, $lang_admin = 'es') {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/projects');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'projects')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('projects')) {
            // borramos la imagen
            @unlink($obj->image);
            // borramos las categorias
            $this->db->delete($this->db->dbprefix . 'projects_categories', array('project_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/projects/index/' . $lang_admin);
    }

    public function edit($id = null, $lang_admin = 'es') {
        // si no existe el id lo mandamos al index
        $id or redirect('admin/projects');
        // buscamos los datos del registro
        $project = $this->db->where('id', $id)->get('projects')->row();
        // buscamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('project_categories')->result();

        // organizamos los datos de las categorias del registro
        $return = $this->db->where('project_id', $id)->get('projects_categories')->result();
        $selected_category = array();

        foreach ($return as $item) {
            $selected_category[] = $item->category_id;
        }

        $this->template
                ->set('categories', $categories)
                ->set('selected_category', $selected_category)
                ->set('project', $project)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    public function update($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'trim');
        $this->form_validation->set_rules('content', 'Descripción', 'trim');
        $this->form_validation->set_rules('category', 'Categoria', 'required|trim');
        $this->form_validation->set_rules('introduction', 'Introducción', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'seefile' => ($post->seefile == "on") ? 1 : 0,
                'category' => $post->category,
                'introduction' => $post->introduction,
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/projects';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'projects/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id)->get('projects')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/projects/index/' . $lang_admin);
                }
            }
            
            // imagen uno
            $file = $_FILES['file']['name'];

            if (!empty($file)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'projects/' . $datos['upload_data']['file_name'];
                    $file = array('file' => $path);
                    $data = array_merge($data, $file);
                    $obj = $this->db->where('id', $post->id)->get('projects')->row();
                    @unlink($obj->file);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/projects/index/' . $lang_admin);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('projects', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/projects/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/projects/edit/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/projects/index/' . $lang_admin);
        }
    }
    
    public function orden_projects() {
        // inicializamos las variables
        $statusJson = '';
        $msgJson = '';
        $datosArray = $_POST['subCatArray'];  // tomamos los datos del post y se los damos al data

        $datosArray = array_unique($datosArray);  // quitamos los repetidos
        $datosArray = array_values($datosArray);  // ordenamos el array de 0 a n
        // ponemos el orden de las categorias
        $i = 1;
        foreach ($datosArray as $fila => $idRegistro) {
            $data = array(
                'position' => $i,
            );
            // actualizamos el registro
            if ($this->db->where('id', $idRegistro)->update('projects', $data)) {
                if ($statusJson != "error") {
                    $statusJson = "";
                    $msgJson = "El campo se ha cambiado con éxito.";
                }
            } else {
                $statusJson = "error";
                $msgJson = "Ocurrió un error. Actualizando las posiciones";
            }
            $i++;
        }

        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }
/*
     * Categorias
     */

    public function create_category($lang_admin = 'es') {
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('project_categories')->result();
        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_category');
    }

    public function store_category($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        // si la validación es correcta
        if ($this->form_validation->run() === TRUE) {

            // guardamos los datos del post
            $post = (object) $this->input->post();

            // organizamos los datos para el insert
            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            // insertamos el registro
            if ($this->db->insert('project_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/projects/create_category/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/projects/create_category/' . $lang_admin);
        }
    }

    public function destroy_category($id = null, $lang_admin = 'es') {
        // si el id no existe, lo mandamos la pág principal de categorias
        $id or redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');

        // varificamos que la categoria no tenga subcategorias
        $items = $this->db->where('parent', $id)->get('project_categories')->result();
        if (count($items) > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene subcategorias');
            redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
        }
        // verificamos que la categoria no tenga projectos
        $itemsProd = $this->db
                        ->select('COUNT(*) AS numreg')
                        ->from('projects_categories')
                        ->where('category_id', $id)
                        ->get()->result();
        if ($itemsProd[0]->numreg > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene projectos asignados');
            redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
        }
        // borramos el registro
        if ($this->db->where('id', $id)->delete('project_categories')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
    }

    public function edit_category($id = null, $lang_admin = 'es') {
        // buscamos la categoria
        $category = $this->db->where('id', $id)->get('project_categories')->row();
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('project_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('category', $category)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_category');
    }

    public function update_category($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        if ($this->form_validation->run() === TRUE) {
            // guardamos los datos del post
            $post = (object) $this->input->post();

            // organizamos los datos de la actualización
            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'lang' => $lang_admin,
            );

            // actualizamos el registro
            if ($this->db->where('id', $post->id)->update('project_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/projects/edit_category/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/projects/index/' . $lang_admin . '/#page-structure-categories');
        }
    }
    
    public function orden_categories() {
        // inicializamos las variables
        $statusJson = '';
        $msgJson = '';
        $datosArray = $_POST['subCatArray'];  // tomamos los datos del post y se los damos al data

        $datosArray = array_unique($datosArray);  // quitamos los repetidos
        $datosArray = array_values($datosArray);  // ordenamos el array de 0 a n
        // ponemos el orden de las categorias
        $i = 1;
        foreach ($datosArray as $fila => $idRegistro) {
            $data = array(
                'position' => $i,
            );
            // actualizamos el registro
            if ($this->db->where('id', $idRegistro)->update('project_categories', $data)) {
                if ($statusJson != "error") {
                    $statusJson = "";
                    $msgJson = "El campo se ha cambiado con éxito.";
                }
            } else {
                $statusJson = "error";
                $msgJson = "Ocurrió un error. Actualizando las posiciones";
            }
            $i++;
        }

        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }
    
    /*
     * Actualizar Intro
     */

    public function update_intro($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('content', 'Texto', 'trim');
        if ($this->form_validation->run() === TRUE) {
            // guardamos los datos del post
            $post = (object) $this->input->post();
            // organizamos los datos para la actualización
            $data = array(
                'title' => $post->title,
                'text' => html_entity_decode($post->content)
            );
            
            // actualizamos los registros
            if ($this->db->where('lang', $lang_admin)->where('id', $post->id)->update('projects_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('gallery:error_message'));
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
        }
        redirect('admin/projects/index/' . $lang_admin . '/#page-intro');
    }

}
