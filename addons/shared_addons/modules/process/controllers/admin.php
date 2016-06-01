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
        $this->lang->load('process');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "proces_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1) {
        // Paginación de procesos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('users')
                        ->where('group_id', '3')
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/process/index/' . $lang_admin, $count_all, 10, 4);
        
        $clientes = $this->db
                ->where('group_id', '3')
                ->limit($pagination['limit'], $pagination['offset'])
                ->get('users')
                ->result();

        $estados = $this->db->get('process_state')->result();

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('clientes', $clientes)
                ->set('estados', $estados)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }

    //////////////DOCUMENTOS DE USUARIO//////////

    public function user_process($idUser, $pag = 1) {

        if (empty($idUser)) {
            redirect('admin');
        }
        // Paginación de procesos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->where('id_user', $idUser)
                        ->from('user_process')
                        ->order_by('id', 'DESC')
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/process/user_process', $count_all, 10, 4);
        $usuario = $this->db->where('id', $idUser)->get('users')->row();

        $docs = $this->db->where('id_user', $idUser)->order_by('id', 'DESC')->get('user_process')->result();

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('docs', $docs)
                ->set('usuario', $usuario)
                ->build('admin/user_process');
    }

    public function create_process($id) {

        $estados = $this->db->get('process_state')->result();

        $this->template
                ->set('estados', $estados)
                ->set('id', $id)
                ->build('admin/create_process');
    }

    public function store_process() {

        // Validaciones del Formulario
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('cod', 'Codigo', 'trim');
        $this->form_validation->set_rules('id_estado', 'Estado', 'trim');
        $this->form_validation->set_rules('description', 'Descripcion', 'trim');
        $this->form_validation->set_rules('introduction', 'Introduccion', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {

            $post = (object) $this->input->post();
            // Array que se insertara en la base de datos
            $data = array(
                'id_user' => $post->id_user,
                'title' => $post->title,
                'cod' => $post->cod,
                'id_estado' => $post->id_estado,
                'description' => $post->description,
                'introduction' => $post->introduction,
            );

            // Se inserta en la base de datos
            if ($this->db->insert('user_process', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/process/user_process/' . $post->id_user);
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/create_process/' . $post->id_user);
        }
    }

    public function edit_process($id = null, $idUser) {
        // si no existe el id lo mandamos al index
        $idUser or redirect('admin');
        // buscamos los datos del registro
        $doc = $this->db->where('id', $id)->get('user_process')->row();

        $estados = $this->db->get('process_state')->result();

        $select = $doc->id_estado;

        $this->template
                ->set('doc', $doc)
                ->set('idUser', $idUser)
                ->set('estados', $estados)
                ->set('select', $select)
                ->build('admin/edit_process');
    }

    public function update_process($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('cod', 'Codigo', 'trim');
        $this->form_validation->set_rules('id_estado', 'Estado', 'trim');
        $this->form_validation->set_rules('description', 'Descripcion', 'trim');
        $this->form_validation->set_rules('introduction', 'Introduccion', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'id_user' => $post->id_user,
                'title' => $post->title,
                'id_estado' => $post->id_estado,
                'cod' => $post->cod,
                'description' => $post->description,
                'introduction' => $post->introduction,
            );

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('user_process', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/process/user_process/' . $post->id_user);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/process/edit_process/' . $post->id . '/' . $post->id_user);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/user_process/' . $post->id_user);
        }
    }

    public function destroy_process($id = null, $user) {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/process/user_process/' . $user);
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'user_process')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('user_process')) {
            // borramos la imagen
            @unlink($obj->file);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/process/user_process/' . $user);
    }

    ////////////DOCUMENTOS DE PROCESO/////////////

    public function docs($idItem) {

        if (empty($idItem)) {
            redirect('admin');
        }
        // Paginación de procesos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->where('id_user_process', $idItem)
                        ->from('process_doc')
                        ->order_by('id', 'DESC')
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/process/docs', $count_all, 10, 4);
        $docs = $this->db->where('id_user_process', $idItem)->get('process_doc')->result();

        $process = $this->db->where('id', $idItem)->get('user_process')->row();

        $user = $process->id_user;

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('docs', $docs)
                ->set('process', $process)
                ->set('user', $user)
                ->build('admin/process_docs');
    }

    public function create_doc($idP) {

        $this->template
                ->set('idP', $idP)
                ->build('admin/create_doc');
    }

    public function store_doc() {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Titulo', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {

            $post = (object) $this->input->post();
            // Array que se insertara en la base de datos
            $data = array(
                'id_user_process' => $post->id_user_process,
                'name' => $post->name
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/user_process';
            $config['allowed_types'] = 'pdf';
            $config['max_size'] = 100000000000;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['file']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'user_process/' . $datos['upload_data']['file_name'];
                    $img = array('file' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/process/user_process/' . $post->id_user);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->insert('process_doc', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/process/docs/' . $post->id_user_process);
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/create_doc/' . $post->id_user_process);
        }
    }

    public function edit_doc($id = null, $idP) {
        // si no existe el id lo mandamos al index
        $idP or redirect('admin');
        // buscamos los datos del registro
        $doc = $this->db->where('id', $id)->get('process_doc')->row();

        $this->template
                ->set('doc', $doc)
                ->set('idP', $idP)
                ->build('admin/edit_doc');
    }

    public function update_doc($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Titulo', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'id_user_process' => $post->id_user_process,
                'name' => $post->name
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/user_process';
            $config['allowed_types'] = 'pdf';
            $config['max_size'] = 100000000000;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['file']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('file')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'user_process/' . $datos['upload_data']['file_name'];
                    $img = array('file' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id)->get('process_doc')->row();
                    @unlink($obj->file);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/process/docs/' . $post->id_user_process);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('process_doc', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/process/docs/' . $post->id_user_process);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/process/docs/' . $post->id_user_process);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/docs/' . $post->id_user_process);
        }
    }

    public function destroy_doc($id = null, $process) {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/process/docs/' . $process);
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'process_doc')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('process_doc')) {
            // borramos la imagen
            @unlink($obj->file);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/process/docs/' . $process);
    }

    /////////ESTADO DE PROCESO/////////

    public function create_est($id) {

        $this->template
                ->set('id', $id)
                ->build('admin/create_est');
    }

    public function store_est() {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Titulo', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {

            $post = (object) $this->input->post();
            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name
            );

            // Se inserta en la base de datos
            if ($this->db->insert('process_state', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/process/index/#page-est');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/index/#page-est');
        }
    }

    public function edit_est($id = null) {
        // si no existe el id lo mandamos al index
        $id or redirect('admin');
        // buscamos los datos del registro
        $doc = $this->db->where('id', $id)->get('process_state')->row();

        $this->template
                ->set('doc', $doc)
                ->build('admin/edit_est');
    }

    public function update_est($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Titulo', 'trim');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name
            );

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('process_state', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/process/index/#page-est');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/process/index/#page-est');
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/process/index/#page-est');
        }
    }

    public function destroy_est($id = null) {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/process/index/#page-est');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'process_state')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('process_state')) {
            // borramos la imagen
            @unlink($obj->file);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/process/index/#page-est');
    }

    ////////MAIL INFO//////////

    public function send_info($idUser, $idP) {

        $user = $this->db->where('id', $idUser)->get('users')->row();
        $process = $this->db->where('id', $idP)->get('user_process')->row();

        $this->template
                ->set('user', $user)
                ->set('process', $process)
                ->build('admin/send_info');
    }

    function send() {
        $this->form_validation->set_rules('message', 'Mensaje', 'trim');

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post(null);

            $email = $post->mail;

            $data['post'] = array(
                'message' => $post->message,
                'process' => $post->process,
                'date' => date('Y-m-d H:i:s'),
            );

            $this->send_email_to_user($data['post'], $email);

            $this->session->set_flashdata('success', 'El mensaje ha sido enviado');
            redirect('admin/process/user_process/' . $post->idUser);
        } else {
            $this->session->set_flashdata('error', 'Error, no se envió el mensaje, intentelo nuevamente');
            redirect('admin/process/user_process/' . $post->idUser);
        }
        redirect('admin/process/user_process/' . $post->idUser);
    }

    /**
     * Send an email
     *
     * @param array $comment The comment data.
     * @param array $entry The entry data.
     * @return boolean 
     */
    private function send_email_to_user($data, $email) {
        $this->load->library('email');
        $this->load->library('user_agent');

//        echo '<pre>';
//        var_dump($email);
//        die;

        Events::trigger('email', array(
            'message' => $data['message'],
            'process' => $data['process'],
            'subject' => 'Cambios en proceso',
            'slug' => 'cambio-en-proceso',
            'to' => $email,
                ), 'array');
    }

}
