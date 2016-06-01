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
        $this->lang->load('faqs');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "faq_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1, $ordering = 0) {
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // Paginación de faqos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('faqs')
                        ->where('lang', $lang_admin)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/faqs/index/' . $lang_admin, $count_all, (empty($ordering) ? 10 : 100000000), 4);
        $search = '';

        // consulta de los faqos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('faqs AS pr')
                ->order_by('position', 'ASC')
                ->where('lang', $lang_admin);

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los faqos
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
        $faqs = $this->db->get()->result();

        if (!empty($faqs)) {
            foreach ($faqs AS $item) {
                $item->price = (!empty($item->price)) ? "$" . number_format($item->price) : null;
            }
        }

        // Intro
        $intro = $this->db->where('lang', $lang_admin)->get('faqs_intro')->result();
        $intro = $intro[0];

        // categorias con sortable (se consultan con un orden)
        $structure_categories = $this->db
                        ->where('lang', $lang_admin)
                        ->order_by('position', 'ASC')
                        ->get('faq_categories')->result();

        // se contruye el html de las categorias
        $structure_categories = $this->faq_model->build_categories($structure_categories, 'faqs', 0, true, null, $lang_admin);

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('faqs', $faqs)
                ->set('intro', $intro)
                ->set('ordering', $ordering)
                ->set('structure_categories', $structure_categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }

    // destacados de los faqos para el home
    public function outstanding_faq($idItem = null, $lang_admin = 'es') {
        // buscamos la cantidad de faqos q existen destacados
        $amount = $this->db->where('lang', $lang_admin)->where('outstanding', 1)->get('faqs')->result();
        $amount = count($amount);

        // buscamos si el registro seleccionado es destacado o no
        $obj = $this->db->where('id', $idItem)->get('faqs')->row();
        $data['outstanding'] = ($obj->outstanding == 1 ? 0 : 1);

        // si existen menos de la cantidad o se va a quitar un destacado
        if ($amount < 3 || $data['outstanding'] == 0) {
            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('faqs', $data)) {
                $statusJson = '';
                $msgJson = 'El faqo ahora es destacado.';
            } else {
                $statusJson = 'error';
                $msgJson = 'Ocurrio un error al cambiar el estado a destacado';
            }
        } else {
            $statusJson = 'error';
            $msgJson = 'Ya llegaste al numero limite de destacados';
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
            if ($this->db->where('id', $idRegistro)->update('faq_categories', $data)) {
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

    public function orden_faqs() {
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
            if ($this->db->where('id', $idRegistro)->update('faqs', $data)) {
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
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('faq_categories')->result();
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
            if ($this->db->insert('faq_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/faqs/create_category/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/faqs/create_category/' . $lang_admin);
        }
    }

    public function destroy_category($id = null, $lang_admin = 'es') {
        // si el id no existe, lo mandamos la pág principal de categorias
        $id or redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');

        // varificamos que la categoria no tenga subcategorias
        $items = $this->db->where('parent', $id)->get('faq_categories')->result();
        if (count($items) > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene subcategorias');
            redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
        }
        // verificamos que la categoria no tenga faqos
        $itemsProd = $this->db
                        ->select('COUNT(*) AS numreg')
                        ->from('faqs_categories')
                        ->where('category_id', $id)
                        ->get()->result();
        if ($itemsProd[0]->numreg > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene Preguntas asignadas');
            redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
        }
        // borramos el registro
        if ($this->db->where('id', $id)->delete('faq_categories')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
    }

    public function edit_category($id = null, $lang_admin = 'es') {
        // buscamos la categoria
        $category = $this->db->where('id', $id)->get('faq_categories')->row();
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('faq_categories')->result();

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
            if ($this->db->where('id', $post->id)->update('faq_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/faqs/edit_category/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/faqs/index/' . $lang_admin . '/#page-structure-categories');
        }
    }

    /*
     * Preguntas Frecuentes
     */

    public function create($lang_admin = 'es') {
        // cargamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('faq_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    // -----------------------------------------------------------------

    public function store($lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('categories', 'Categorias', 'required');
        $this->form_validation->set_rules('content', 'Descripción', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin
            );
            // Se inserta en la base de datos
            if ($this->db->insert('faqs', $data)) {
                $faqId = $this->db->insert_id();
                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'faq_id' => $faqId,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'faqs_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/faqs/index/' . $lang_admin . '/');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/faqs/create/' . $lang_admin);
        }
    }

    // -----------------------------------------------------------------

    public function destroy($id = null, $lang_admin = 'es') {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/faqs');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'faqs')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('faqs')) {
            // borramos la imagen
            @unlink($obj->image);
            // borramos las categorias
            $this->db->delete($this->db->dbprefix . 'faqs_categories', array('faq_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/faqs/index/' . $lang_admin);
    }

    // --------------------------------------------------------------------------------------

    public function edit($id = null, $lang_admin = 'es') {
        // si no existe el id lo mandamos al index
        $id or redirect('admin/faqs');
        // buscamos los datos del registro
        $faq = $this->db->where('id', $id)->get('faqs')->row();
        // buscamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('faq_categories')->result();

        // organizamos los datos de las categorias del registro
        $return = $this->db->where('faq_id', $id)->get('faqs_categories')->result();
        $selected_category = array();

        foreach ($return as $item) {
            $selected_category[] = $item->category_id;
        }

        $this->template
                ->set('categories', $categories)
                ->set('selected_category', $selected_category)
                ->set('faq', $faq)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    // -----------------------------------------------------------------

    public function update($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('categories', 'Categorias', 'required');
        $this->form_validation->set_rules('content', 'Descripción', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'lang' => $lang_admin
            );

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('faqs', $data)) {
                // borramos los datos de las categorias
                $this->db->delete($this->db->dbprefix . 'faqs_categories', array('faq_id' => $post->id)); // Eliminaos relación pro cat

                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'faq_id' => $post->id,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'faqs_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/faqs/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/faqs/edit/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/faqs/index/' . $lang_admin);
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
                'text' => html_entity_decode($post->content)
            );
            // actualizamos los registros
            if ($this->db->where('lang', $lang_admin)->where('id', $post->id)->update('faqs_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('gallery:error_message'));
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
        }
        redirect('admin/faqs/index/' . $lang_admin . '/#page-intro');
    }

}
