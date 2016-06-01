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
        $this->lang->load('services');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "service_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1, $ordering = 0) {
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // Paginación de servicios
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('services')
                        ->where('lang', $lang_admin)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/services/index/' . $lang_admin, $count_all, (empty($ordering) ? 10 : 100000000), 4);
        $search = '';

        // consulta de los servicios a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('services AS pr')
                ->order_by('position', 'ASC')
                ->where('lang', $lang_admin);

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los servicios
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
        $services = $this->db->get()->result();

        // Intro
        $intro = $this->db->where('lang', $lang_admin)->get('services_intro')->row();

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('services', $services)
                ->set('intro', $intro)
                ->set('ordering', $ordering)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
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
            if ($this->db->where('lang', $lang_admin)->update('services_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('gallery:error_message'));
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
        }
        redirect('admin/services/index/' . $lang_admin . '/#page-intro');
    }
    
    /*
     * Servicios
     */
    
    public function outstanding_service($idItem = null, $lang_admin = 'es') {
        // buscamos la cantidad de servicios q existen destacados
        $amount = $this->db->where('lang', $lang_admin)->where('outstanding', 1)->get('services')->result();
        $amount = count($amount);

        // buscamos si el registro seleccionado es destacado o no
        $obj = $this->db->where('id', $idItem)->get('services')->row();
        $data['outstanding'] = ($obj->outstanding == 1 ? 0 : 1);

        // si existen menos de la cantidad o se va a quitar un destacado
        if ($amount < 2 || $data['outstanding'] == 0) {
            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('services', $data)) {
                $statusJson = '';
                $msgJson = 'El servicio ahora es destacado.';
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
     
    public function orden_services() {
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
            if ($this->db->where('id', $idRegistro)->update('services', $data)) {
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
    
    public function create($lang_admin = 'es') {
        
        $this->template
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    public function store($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'trim');
        $this->form_validation->set_rules('content', 'Descripción', 'trim');
        $this->form_validation->set_rules('introduction', 'Introducción', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'introduction' => $post->introduction,
                'seefile' => ($post->seefile == "on") ? 1 : 0,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/services';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'services/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/services/');
                }
            }
            
            // imagen uno
            $file = $_FILES['file']['name'];

            if (!empty($file)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'services/' . $datos['upload_data']['file_name'];
                    $file = array('file' => $path);
                    $data = array_merge($data, $file);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/services/');
                }
            }

            // Se inserta en la base de datos
            if ($this->db->insert('services', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/services/index/' . $lang_admin . '/');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/services/create/' . $lang_admin);
        }
    }
    
    public function edit($id = null, $lang_admin = 'es') {
        // si no existe el id lo mandamos al index
        $id or redirect('admin/services');
        // buscamos los datos del registro
        $service = $this->db->where('id', $id)->get('services')->row();
        
        $this->template
                ->set('service', $service)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    public function update($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'trim');
        $this->form_validation->set_rules('content', 'Descripción', 'trim');
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
                'introduction' => $post->introduction,
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/services';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|pdf';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'services/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id)->get('services')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/services/index/' . $lang_admin);
                }
            }
            
            // imagen uno
            $file = $_FILES['file']['name'];

            if (!empty($file)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'services/' . $datos['upload_data']['file_name'];
                    $file = array('file' => $path);
                    $data = array_merge($data, $file);
                    $obj = $this->db->where('id', $post->id)->get('services')->row();
                    @unlink($obj->file);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/services/index/' . $lang_admin);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('services', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/services/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/services/edit/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/services/index/' . $lang_admin);
        }
    }
    
    public function destroy($id = null, $lang_admin = 'es') {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/services');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'services')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('services')) {
            // borramos la imagen
            @unlink($obj->image);
            // borramos las categorias
            $this->db->delete($this->db->dbprefix . 'services_categories', array('service_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/services/index/' . $lang_admin);
    }
    
}
