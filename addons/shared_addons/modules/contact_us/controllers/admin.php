<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Luis Fernando Salazar
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('language');
        $this->load->library('form_validation');
        $this->template
                ->append_css('module::css-contact_us.css')
                ->append_js('module::developer.js')
                ->append_js('module::jquery.geocomplete.min.js')
                ->append_js('module::admin/ajax.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            'google_map_model',
            'google_map_category_model',
            'google_map_image_model',
            'google_map_intro_model',
            'contact_us_m',
            'contact_us_emails_m'
        );
        $this->load->model($models);
    }

    /**
     * List all domains
     */
    public function index($lang_admin = 'es', $pag = 1) {
        $this->form_validation->set_rules('facebook', 'facebook', 'max_length[455]|valid_url');
        $this->form_validation->set_rules('twitter', 'twitter', 'max_length[455]|valid_url');
        $this->form_validation->set_rules('linkedin', 'linkedin', 'max_length[455]|valid_url');
        $this->form_validation->set_rules('adress', 'Dirección', 'max_length[200]|trim');
        $this->form_validation->set_rules('phone', 'Telefono', 'max_length[100]|trim');
        $this->form_validation->set_rules('email', 'Correo', 'max_length[100]|trim');
        $this->form_validation->set_rules('text', 'Horario', 'trim');
        $this->form_validation->set_rules('map', 'Mapa de google', 'trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            $contact_us = $this->contact_us_m->where('lang', $lang_admin)->get_all();
            $contact_us = $contact_us[0];

//            $pagination = create_pagination('admin/contact_us/index/', $this->contact_us_emails_m->count_all(), 20);
//            $contact_us_emails = $this->contact_us_emails_m->limit($pagination['limit'], $pagination['offset'])->order_by('id', 'DESC')->get_all();
            $emails_area = $this->db->where('lang', $lang_admin)->get('contact_us_emails_area')->result();

            //Mapas de google control del index
            // Paginación de Mapas de google
            $count_all = $this->db->select('COUNT(*) AS numreg')
                            ->from('google_maps')
                            ->where('lang', $lang_admin)
                            ->get()->row()->numreg;
//            $pagination = create_pagination('admin/google_maps/index', $count_all, 10, 4);
            // Se consultan los Mapas de google
            $google_maps = $this->db
                            ->order_by('id', 'DESC')
                            ->where('lang', $lang_admin)
                            ->limit($pagination['limit'], $pagination['offset'])
                            ->get('google_maps')->result();

            // Consultamos las categorias
            $categories = $this->google_map_category_model
                    ->order_by('id', 'DESC')
                    ->where('lang', $lang_admin)
                    ->get_all();

            foreach ($categories as $key => $value) {
                $parent = $value->parent;
                if ($parent != 0) {
                    $parent_name = $this->google_map_category_model->get($parent);
                    if (!empty($parent_name)) {
                        $categories[$key]->parent_name = $parent_name->title;
                    }
                } else {
                    $categories[$key]->parent_name = "";
                }
            }

            // categorias con sortable (se consultan con un orden)
            $structure_categories = $this->google_map_category_model
                    ->order_by('position', 'ASC')
                    ->where('lang', $lang_admin)
                    ->get_all();
            //var_dump($structure_categories);
            $structure_categories = $this->build_categories($structure_categories, 'google_maps', 0, true, null, $lang_admin);

//            echo '<pre>';var_dump($google_maps);die;

            $this->template
                    ->append_js('module::admin/ajax.js')
                    ->set('pagination', $pagination)
                    ->set('google_maps', $google_maps)
                    ->set('categories', $categories)
                    ->set('structure_categories', $structure_categories)
                    ->set('data', $contact_us)
                    ->set('emails_area', $emails_area)
                    ->set('lang_admin', $lang_admin)
                    ->build('admin/contact_us_back');
        } else { // si el formulario ha sido enviado con éxito se procede
            // quitamos los campos del text_wysiwyg
            if (isset($_POST['text_wysiwyg'])) {
                unset($_POST['text_wysiwyg']);
            }
            if (isset($_POST['text_wysiwyg_map'])) {
                unset($_POST['text_wysiwyg_map']);
            }
            // quitamos el valor del boton
            unset($_POST['btnAction']);
            // organizamos los campos que sean necesarios
            if (isset($_POST['text'])) {
                $_POST['schedule'] = html_entity_decode($_POST['text']);
                unset($_POST['text']);
            }
            if (isset($_POST['map'])) {
                $_POST['map'] = html_entity_decode($_POST['map']);
            }
            $data = $_POST;

            if ($this->contact_us_m->where('lang', $lang_admin)->update_all($data)) {

                // insert ok, so
                $this->session->set_flashdata('success', lang('contact_us:success_message'));
                redirect('admin/contact_us/index/' . $lang_admin . '#page-view');
            } else {
                $this->session->set_flashdata('error', lang('contact_us:error_message'));
                redirect('admin/contact_us/index/' . $lang_admin . '#page-details');
            }

            $this->template
                    ->set('lang_admin', $lang_admin)
                    ->set('funcion', 'edit')
                    ->build('admin/contact_us_back');
        }
    }

    public function delete_email($id = null) {
        $id or redirect('admin/contact_us/');
        if ($this->db->where('id', $id)->delete('contact_us_emails')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/contact_us/');
    }

    public function delete_email_dashboard($id = null) {
        $id or redirect('admin/contact_us/');
        if ($this->db->where('id', $id)->delete('contact_us_emails')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin');
    }
    
    public function delete_quiz($id = null) {
        $id or redirect('admin/contact_us/');
        if ($this->db->where('id', $id)->delete('quiz')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin');
    }

    public function view_message($idItem) {
        $contact_us_email = $this->contact_us_emails_m->where('id', $idItem)->get_all();
        if (!empty($contact_us_email)) {
            $contact_us_email = $contact_us_email[0];
        }

        $this->template
                ->set_layout(FALSE)
                ->set('data', $contact_us_email)
                ->build('admin/view_message');
    }

    public function view_message_dashboard($idItem) {
        $contact_us_email = $this->contact_us_emails_m->where('id', $idItem)->get_all();
        if (!empty($contact_us_email)) {
            $contact_us_email = $contact_us_email[0];
            $data = array(
                'status' => 1
            );
            $this->db->where('id', $idItem)->update('contact_us_emails', $data);
        }

        $this->template
                ->set_layout(FALSE)
                ->set('data', $contact_us_email)
                ->build('admin/view_message_dashboard');
    }

    /*

     * Administración de emails area

     */

    // ----------------------------------------------------------------------------------

    public function create_email($lang_admin = 'es') {
        $contact_us = $this->db->where('lang', $lang_admin)->get('contact_us')->row();

        $this->template
                ->set('contact_us', $contact_us)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_email');
    }

    // -----------------------------------------------------------------

    public function store_email($lang_admin = 'es') {
        $id = $this->input->post('id');
        $post = (object) $this->input->post();

        $email = array(
            'title' => $post->title,
            'lang' => $lang_admin
        );

        // Se inserta en la base de datos
        if ($this->db->insert('contact_us_emails_area', $email)) {
            $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            redirect('admin/contact_us/index/' . $lang_admin . '#page-areas');
        } else {
            $this->session->set_flashdata('error', lang('galeria:error_message'));
            redirect('admin/contact_us/create_email/' . $lang_admin . '/' . $id);
        }
    }
    
    public function edit_email($id = null, $lang_admin = 'es') {
        
        $asunto = $this->db->where('id', $id)->get('contact_us_emails_area')->row();
        
        $this->template
                ->set('asunto', $asunto)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_email');
    }
    
     public function update_email($id = null, $lang_admin = 'es') {
        $post = (object) $this->input->post();

        $email = array(
            'title' => $post->title,
            'lang' => $lang_admin
        );

        // Se inserta en la base de datos
        if ($this->db->where("id",$id)->update('contact_us_emails_area', $email)) {
            $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            redirect('admin/contact_us/index/' . $lang_admin . '#page-areas');
        } else {
            $this->session->set_flashdata('error', lang('galeria:error_message'));
            redirect('admin/contact_us/create_email/' . $lang_admin . '/' . $id);
        }
    }

    public function destroy_email($id = null, $data_id = null, $lang_admin = 'es') {
        $id or redirect('admin/contact_us/index/' . $lang_admin);
        if ($this->db->where('id', $id)->delete('contact_us_emails_area')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/contact_us/index/' . $lang_admin . '#page-areas');
    }

    // -----------------------------------------------------------------

    public function export_contact_mail($status = 1) {
        $this->load->library(array('to_excel'));
        $headers = array();
        $namefile = "Mensajes";
        $datosSql = $this->db
                ->select('ce.name AS Nombre, ce.email AS Correo, ce.phone AS Telefono, ce.cell AS Celular, ce.company AS Empresa, ce.city AS Ciudad, ce.message AS Mensaje')
                ->from('contact_us_emails AS ce')
                ->get();

        $i = 0;

        foreach ($datosSql->result_array() as $row => $value) {
            $i = 0;
            foreach ($value as $row2 => $value2) {
                array_push($headers, $row2);
                $i++;
            }
            break;
        }
        $arrayExcel = $datosSql->result();
        array_unshift($arrayExcel, $headers);
        $this->to_excel($datosSql, $namefile);
    }

    // pasar un query sql de codeigniter a excel
    function to_excel($datosSql, $filename = 'exceloutput') {
        $encabezadoExcel = '';  // just creating the var for field headers to append to below
        $datosExcel = '';  // just creating the var for field data to append to below	     

        $obj = & get_instance();

        if ($datosSql->num_rows() == 0) {
            echo '<p>La tabla no tiene datos.</p>';
        } else {
            foreach ($datosSql->result_array() as $row => $value) {
                $encabezadoExcel = '';
                foreach ($value as $row2 => $value2) {
                    $encabezadoExcel .= $row2 . "\t";
                }
            }

            foreach ($datosSql->result() as $row) {
                $lineaExcel = '';
                foreach ($row as $value) {
                    if ((!isset($value)) OR ( $value == "")) {
                        $value = "\t";
                    } else {
                        $value = str_replace('"', '""', $value);
                        $value = '"' . $value . '"' . "\t";
                    }
                    $lineaExcel .= $value;
                }
                $datosExcel .= trim($lineaExcel) . "\n";
            }

            $datosExcel = str_replace("\r", "", $datosExcel);

            // pasar los datos de utf-8 a ansi
            $datosExcel = iconv('UTF-8', 'ISO-8859-1', $datosExcel);
            $encabezadoExcel = iconv('UTF-8', 'ISO-8859-1', $encabezadoExcel);
            header("Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");  // for Excel 2007
            header("Content-Disposition: attachment; filename=$filename.xls");
            echo "$encabezadoExcel\n$datosExcel";
        }
    }

    /*
     * Administracion de mapas de google con buscador
     *      
     */

    public function orden_categories() {
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

            if ($this->google_map_category_model->update($idRegistro, $data)) {
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

    public function build_categories($rows, $module = null, $parent = 0, $ban = true, $current = null, $lang_admin = 'es') {
        $classCategories = 'cat_1';
        $classSubcategoriesFather = 'sortable ui-sortable';
        $classSubcategories = 'subcategori';
        $classActive = 'Activo';

        $result = "<ul class='sortable ui-sortable'>";
        //if($ban) $result.= "<li id='todos'><a href='{$module}'>Todos</a></li>";
        foreach ($rows as $row) {
            if ($row->parent == $parent) {
                foreach ($rows as $subrow) {
                    if ($subrow->parent == $row->id)
                        $children = true;
                    else
                        $children = false;
                }
                $result.= "<li id='" . $row->id . "' class='" . ($row->parent == 0 ? $classCategories : ($children ? $classSubcategoriesFather : $classSubcategories)) . ' ' . ($row->title == $current ? $classActive : '') . "'><a href='admin/contact_us/edit_category/" . $row->id . "/" . $lang_admin . "' class='edit_categories_ajax'>" . $row->title . "</a>";
                if ($children = true)
                    $result.= $this->build_categories($rows, $module, $row->id, false, $current) . "</li>";
            }
        }
        $result .= "</ul>";
        return $result;
    }

    /*
     * Categorias
     */

    public function create_category($lang_admin = 'es') {
        $categories = $this->google_map_category_model->where('lang', $lang_admin)->order_by('id', 'ASC')->get_all();
        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_category');
    }

    // -----------------------------------------------------------------

    public function store_category($lang_admin = 'es') {

        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        if ($this->form_validation->run() === TRUE) {
            if (!isset($_POST['outstanding'])) {
                $_POST['outstanding'] = 0;
            } else {
                $_POST['outstanding'] = 1;
            }

            $post = (object) $this->input->post();

            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'outstanding' => $post->outstanding,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            if ($this->google_map_category_model->insert($data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/contact_us/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/contact_us/create_category/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/contact_us/create_category/' . $lang_admin);
        }
    }

    // -----------------------------------------------------------------

    public function destroy_category($id = null, $lang_admin = 'es') {
        $id or redirect('admin/contact_us#page-categories');
        if ($this->google_map_category_model->delete($id)) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/contact_us/index/' . $lang_admin . '/#page-structure-categories');
    }

    // --------------------------------------------------------------------------------------

    public function edit_category($id = null, $lang_admin = 'es') {
        $category = $this->google_map_category_model->get($id);
        $categories = $this->google_map_category_model->where('lang', $lang_admin)->order_by('id', 'ASC')->get_all();
        $this->template
                ->set('categories', $categories)
                ->set('category', $category)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_category');
    }

    // -----------------------------------------------------------------

    public function update_category($lang_admin = 'es') {

        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        if ($this->form_validation->run() === TRUE) {
            if (!isset($_POST['outstanding'])) {
                $_POST['outstanding'] = 0;
            } else {
                $_POST['outstanding'] = 1;
            }

            $post = (object) $this->input->post();

            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'outstanding' => $post->outstanding,
                'lang' => $lang_admin,
            );

            if ($this->google_map_category_model->update($post->id, $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/contact_us/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/contact_us/edit_category/' . $post->id . '/' . $lang_admin . '#page-google_maps');
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/contact_us/edit_category/' . $post->id . '/' . $lang_admin);
        }
    }

    /*
     * Mapas de google
     */

    public function create($lang_admin = 'es') {
        $categories = $this->google_map_category_model->where('lang', $lang_admin)->order_by('id', 'ASC')->get_all();
        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    // -----------------------------------------------------------------

    public function store($lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('adress', 'Dirección', 'required|trim');
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('categories', 'Categorias', 'required');
        $this->form_validation->set_rules('schedule', 'Horarios', 'required|trim');
        $this->form_validation->set_rules('description', 'Descripción', 'required|trim');
        $this->form_validation->set_rules('coordinate1', 'Cordinada 1', 'required|trim');
        $this->form_validation->set_rules('coordinate2', 'Cordinada 2', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'adress' => $post->adress,
                'name' => $post->name,
                'slug' => slug($post->name),
                'schedule' => $post->schedule,
                'description' => $post->description,
                'coordinate1' => $post->coordinate1,
                'coordinate2' => $post->coordinate2,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/google_maps';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'google_maps/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/contact_us/index/' . $lang_admin);
                }
            }

            // Se inserta en la base de datos
            if ($this->google_map_model->insert($data)) {

                $google_mapId = $this->db->insert_id();
                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'google_map_id' => $google_mapId,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'google_maps_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/contact_us/index/' . $lang_admin . '#page-google_maps');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/contact_us/create/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/contact_us/create/' . $lang_admin);
        }
    }

    // -----------------------------------------------------------------

    public function destroy($id = null, $lang_admin = 'es') {
        $id or redirect('admin/contact_us');
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'google_maps')->row();
        if ($this->google_map_model->delete($id)) {
            @unlink($obj->image); // Eliminamos archivo existente
            $this->db->delete($this->db->dbprefix . 'google_maps_categories', array('google_map_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/contact_us/index/' . $lang_admin . '#page-google_maps');
    }

    // --------------------------------------------------------------------------------------

    public function edit($id = null, $lang_admin = 'es') {
        $id or redirect('admin/contact_us');
        $google_map = $this->google_map_model->get($id);
        $categories = $this->google_map_category_model->where('lang', $lang_admin)->order_by('id', 'ASC')->get_all();

        $return = $this->db->where('google_map_id', $id)->get('google_maps_categories')->result();
        $selected_category = array();

        foreach ($return as $item) {
            $selected_category[] = $item->category_id;
        }

        $this->template
                ->set('categories', $categories)
                ->set('selected_category', $selected_category)
                ->set('google_map', $google_map)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    // -----------------------------------------------------------------

    public function update($id = null, $lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('adress', 'Dirección', 'trim');
        $this->form_validation->set_rules('name', 'Nombre', 'trim');
        $this->form_validation->set_rules('categories', 'Categorias', 'required');
        $this->form_validation->set_rules('schedule', 'Horarios', 'trim');
        $this->form_validation->set_rules('description', 'Descripción', 'trim');
        $this->form_validation->set_rules('coordinate1', 'Cordinada 1', 'required|trim');
        $this->form_validation->set_rules('coordinate2', 'Cordinada 2', 'required|trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'adress' => $post->adress,
                'name' => $post->name,
                'slug' => slug($post->name),
                'schedule' => $post->schedule,
                'description' => $post->description,
                'coordinate1' => $post->coordinate1,
                'coordinate2' => $post->coordinate2,
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/google_maps';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'google_maps/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $id)->get('google_maps')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/contact_us/index/' . $lang_admin . '#page-google_maps');
                }
            }

            // Se inserta en la base de datos
            if ($this->google_map_model->update($id, $data)) {

                $this->db->delete($this->db->dbprefix . 'google_maps_categories', array('google_map_id' => $id)); // Eliminaos relación pro cat

                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'google_map_id' => $id,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'google_maps_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/contact_us/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/contact_us/edit/' . $id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/contact_us/edit/' . $id . '/' . $lang_admin);
        }
    }

    public function view_contact_prod_items($idItem) {
        if (!empty($idItem)) {
            $products = $this->db->select('pr.*')
                    ->from('contact_us_email_products AS pi')
                    ->join('products AS pr', 'pi.id_product = pr.id', 'left')
                    ->where('id_email', $idItem)
                    ->get()
                    ->result();

            foreach ($products as $item) {
                if (empty($item->image)) {
                    $image_excel = $this->db->where('id', $item->image_excel)->get('files')->row()->filename;
                }
                $item->image = (!empty($item->image) ? val_image($item->image) : 'uploads/default/files/' . $image_excel);
            }
        } $this->template
                ->set_layout(FALSE)
                ->set('products', $products)
                ->build('admin/view_contact_prod_items');
    }

}
