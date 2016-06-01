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
        $this->lang->load('gallerys');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "gallery_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1, $ordering = 0) {
        $userlog = $this->db->where('id', $this->current_user->id)->get('users')->row()->group_id;
        $group = $this->db->where('id', $userlog)->get('groups')->row()->id;
        
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // Paginación de galleryos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('gallerys')
                        ->where('lang', $lang_admin)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/gallerys/index/' . $lang_admin, $count_all, (empty($ordering) ? 10 : 100000000), 5);
        $search = '';

        // consulta de los galleryos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('gallerys AS pr')
                ->order_by('position', 'ASC')
                ->where('lang', $lang_admin);

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los galleryos
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
        $gallerys = $this->db->get()->result();
                
        if (!empty($gallerys)) {
            foreach ($gallerys AS $item) {
                $item->fecha = fecha_spanish_full($item->date, false, false);
            }
        }

        // Intro
        $intro = $this->db->where('lang', $lang_admin)->get('gallerys_intro')->result();
        $intro = $intro[0];

        // categorias con sortable (se consultan con un orden)
        $structure_categories = $this->db
                        ->where('lang', $lang_admin)
                        ->order_by('position', 'ASC')
                        ->get('gallery_categories')->result();

        // se contruye el html de las categorias
        $structure_categories = $this->gallery_model->build_categories($structure_categories, 'gallerys', 0, true, null, $lang_admin);
        
        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('group', $group)
                ->set('pagination', $pagination)
                ->set('gallerys', $gallerys)
                ->set('intro', $intro)
                ->set('ordering', $ordering)
                ->set('structure_categories', $structure_categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }
    
    public function apps($idItem = null, $lang_admin = 'es') {
        $obj = $this->db->where('id', $idItem)->get('gallerys_app')->row();
        $data['state'] = ($obj->state == 1 ? 0 : 1);

        if ($this->db->where('id', $idItem)->update('gallerys_app', $data)) {
            $statusJson = '';
            $msgJson = 'Ha cambiado el estado del item';
        } else {
            $statusJson = 'error';
            $msgJson = 'Ocurrio un error al cambiar el estado a destacado';
        }

        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
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
            if ($this->db->where('id', $idRegistro)->update('gallery_categories', $data)) {
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

    public function orden_gallerys() {
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
            if ($this->db->where('id', $idRegistro)->update('gallerys', $data)) {
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
    
    public function orden_docs() {
        /* inicializamos las variables */
        $statusJson = '';
        $msgJson = '';
        $datosArray = $_POST['subCatArray'];  /* tomamos los datos del post y se los damos al data */

        $datosArray = array_unique($datosArray);  /* quitamos los repetidos */
        $datosArray = array_values($datosArray);  /* ordenamos el array de 0 a n */
        /* ponemos el orden de las categorias */
        $i = 1;
        foreach ($datosArray as $fila => $idRegistro) {
            $data = array(
                'position' => $i,
            );
            /* actualizamos el registro */
            if ($this->db->where('id', $idRegistro)->update('gallery_images', $data)) {
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
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('gallery_categories')->result();
        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_category');
    }

    // -----------------------------------------------------------------

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
            if ($this->db->insert('gallery_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/gallerys/create_category/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/gallerys/create_category/' . $lang_admin);
        }
    }

    public function destroy_category($id = null, $lang_admin = 'es') {
        // si el id no existe, lo mandamos la pág principal de categorias
        $id or redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');

        // varificamos que la categoria no tenga subcategorias
        $items = $this->db->where('parent', $id)->get('gallery_categories')->result();
        if (count($items) > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene subcategorias');
            redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
        }
        // verificamos que la categoria no tenga galleryos
        $itemsProd = $this->db
                        ->select('COUNT(*) AS numreg')
                        ->from('gallerys_categories')
                        ->where('category_id', $id)
                        ->get()->result();
        if ($itemsProd[0]->numreg > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene galleryos asignados');
            redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
        }
        // borramos el registro
        if ($this->db->where('id', $id)->delete('gallery_categories')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
    }

    public function edit_category($id = null, $lang_admin = 'es') {
        // buscamos la categoria
        $category = $this->db->where('id', $id)->get('gallery_categories')->row();
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('gallery_categories')->result();

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
            if ($this->db->where('id', $post->id)->update('gallery_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/gallerys/edit_category/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/gallerys/index/' . $lang_admin . '/#page-structure-categories');
        }
    }

    /*
     * galleryos
     */

    public function create($lang_admin = 'es') {
        // cargamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('gallery_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    // -----------------------------------------------------------------

    public function store($lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'intro' => $post->intro,
                'slug' => slug($post->name),
                'date' => ($post->date)? $post->date : date("Y-m-d") ,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/gallerys';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'gallerys/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/gallerys/');
                }
            }

            // Se inserta en la base de datos
            if ($this->db->insert('gallerys', $data)) {
                $galleryId = $this->db->insert_id();
                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'gallery_id' => $galleryId,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'gallerys_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/gallerys/index/' . $lang_admin . '/');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/gallerys/create/' . $lang_admin);
        }
    }

    // -----------------------------------------------------------------

    public function destroy($id = null, $lang_admin = 'es') {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/gallerys');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'gallerys')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('gallerys')) {
            // borramos la imagen
            @unlink($obj->image);
            // borramos las categorias
            $this->db->delete($this->db->dbprefix . 'gallerys_categories', array('gallery_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/gallerys/index/' . $lang_admin);
    }

    // --------------------------------------------------------------------------------------

    public function edit($id = null, $lang_admin = 'es') {
        // si no existe el id lo mandamos al index
        $id or redirect('admin/gallerys');
        // buscamos los datos del registro
        $gallery = $this->db->where('id', $id)->get('gallerys')->row();
        $gallery->fecha = fecha_spanish_full($gallery->date, false, false);
        // buscamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('gallery_categories')->result();

        // organizamos los datos de las categorias del registro
        $return = $this->db->where('gallery_id', $id)->get('gallerys_categories')->result();
        $selected_category = array();

        foreach ($return as $item) {
            $selected_category[] = $item->category_id;
        }

        $this->template
                ->set('categories', $categories)
                ->set('selected_category', $selected_category)
                ->set('gallery', $gallery)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    // -----------------------------------------------------------------

    public function update($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim|max_length[255]');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'intro' => $post->intro,
                'slug' => slug($post->name).$post->id,
                'date' => ($post->date)? $post->date : date("Y-m-d") ,
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/gallerys';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'gallerys/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id)->get('gallerys')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/gallerys/index/' . $lang_admin);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('gallerys', $data)) {
                // borramos los datos de las categorias
                $this->db->delete($this->db->dbprefix . 'gallerys_categories', array('gallery_id' => $post->id)); // Eliminaos relación pro cat

                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'gallery_id' => $post->id,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'gallerys_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/gallerys/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/gallerys/edit/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/gallerys/index/' . $lang_admin);
        }
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
                'text' => html_entity_decode($post->content),
                'title' => $post->title
            );
            
            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/gallerys';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $file = $_FILES['image']['name'];

            if (!empty($file)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'gallerys/' . $datos['upload_data']['file_name'];
                    $file = array('image' => $path);
                    $data = array_merge($data, $file);
                    $obj = $this->db->where('lang', $lang_admin)->get('gallerys_intro')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/gallerys/index/' . $lang_admin . '/#page-intro');
                }
            }
            
            // actualizamos los registros
            if ($this->db->where('lang', $lang_admin)->where('id', $post->id)->update('gallerys_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('gallery:error_message'));
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
        }
        redirect('admin/gallerys/index/' . $lang_admin . '/#page-intro');
    }

    /*
     * Administración de imagenes
     */

    public function images($id = null, $pag = 1, $ordering = 0) {
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/gallerys');
        
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('gallery_images')
                        ->where('gallery_id', $id)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/gallerys/images/' . $id, $count_all, (empty($ordering) ? 10 : 100000000), 5);
        
        // Se consultan las imagenes del gallery
        $images = $this->db
                ->limit($pagination['limit'], $pagination['offset'])
                ->order_by('position', 'ASC')
                ->where('gallery_id', $id)
                ->get('gallery_images')
                ->result();
        
        $pag = $pagination['offset'];
        // se consultan los datos del galleryo
        $gallery = $this->db->where('id', $id)->get('gallerys')->row();

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('gallery', $gallery)
                ->set('pagination', $pagination)
                ->set('ordering', $ordering)
                ->set('images', $images)
                ->build('admin/images');
    }

    public function create_image($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/gallerys');
        // se consultan los datos del galleryo
        $gallery = $this->db->where('id', $id)->get('gallerys')->row();

        $this->template
                ->set('gallery', $gallery)
                ->build('admin/create_image');
    }

    public function edit_image($id = null, $cat = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/gallerys');
        // se consultan los datos del galleryo
        $gallery = $this->db->where('id', $cat)->get('gallerys')->row();
        $gallery_images = $this->db->where('id', $id)->get('gallery_images')->row();
//        echo '<pre>';var_dump($gallery_images);var_dump($gallery_images);die;
        $this->template
                ->set('gallery', $gallery)
                ->set('gallery_images', $gallery_images)
                ->build('admin/edit_image');
    }

    public function create_video($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/gallerys');
        // se consultan los datos del galleryo
        $gallery = $this->db->where('id', $id)->get('gallerys')->row();

        $this->template
                ->set('gallery', $gallery)
                ->build('admin/create_video');
    }

    // -----------------------------------------------------------------
    public function upload_image() {
        $this->form_validation->set_rules('content', 'Contentido', 'trim|max_length[559]');
        $id_gallery = $this->input->post('id_gallery');
        $id_img = $this->input->post('id_img');
        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();
            
            $data = array(
                'title' => $post->title
            );
            
            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/gallerys';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'gallerys/' . $datos['upload_data']['file_name'];
                    $img = array('path' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id_img)->get('gallery_images')->row();
                    @unlink($obj->path);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    $this->edit_image($id_img, $id_gallery);
                }
            }
            if ($this->db->where('id', $post->id_img)->update('gallery_images', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/gallerys/images/' . $id_gallery);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/gallerys/images/' . $id_gallery);
            }
//            gallery_images
        } else {
            $this->session->set_flashdata('error', validation_errors());
            $this->edit_image($id_img, $id_gallery);
        }
    }

    public function store_image() {
        // Se carga la imagen
        $config['upload_path'] = './' . UPLOAD_PATH . '/gallerys';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;

        $this->load->library('upload', $config);

        // se guarda el id del registro
        $id = $this->input->post('id');
        $this->form_validation->set_rules('content', 'Contentido', 'trim|max_length[559]');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            // se guarda el registro dependiendo del tipo
            if (isset($_POST['video'])) {
                $post = (object) $this->input->post();
                $image = array(
                    'video' => $post->video,
                    'title' => $post->title,
                    'gallery_id' => $id,
                );
            } else {

                $post = (object) $this->input->post();
                // imagen
                $img = $_FILES['image']['name'];
                $image = array();

                // se guarda la imagen
                if (!empty($img)) {
                    if ($this->upload->do_upload('image')) {
                        $datos = array('upload_data' => $this->upload->data());
                        $path = UPLOAD_PATH . 'gallerys/' . $datos['upload_data']['file_name'];
                        $image = array(
                            'gallery_id' => $id,
                            'title' => $post->title,
                            'path' => $path
                        );
                    } else {
                        $this->session->set_flashdata('error', $this->upload->display_errors());
                        redirect('admin/gallerys/images/' . $id);
                    }
                }
            }

            // Se inserta en la base de datos

            if ($this->db->insert('gallery_images', $image)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/gallerys/images/' . $id);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/gallerys/create_image/' . $id);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            $this->create_image($id);
        }
    }

    // -----------------------------------------------------------------

    public function destroy_image($id = null, $gallery_id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/gallerys');
        // si no existe el id del galleryo se devuelve al index
        $gallery_id or redirect('admin/gallerys');
        // consiltamos el registro
        $obj = $this->db->where('id', $id)->get('gallery_images')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('gallery_images')) {
            // borramos el archivo
            @unlink($obj->path);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/gallerys/images/' . $gallery_id);
    }

}
