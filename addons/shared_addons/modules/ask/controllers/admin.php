<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @subpackage 	Sobre Nosotros Module
 * @category 	Modulos
 * @license 	Apache License v2.2
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('ask');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            'ask_model'
        );
        $this->load->model($models);
    }

    // ------------------------------------------------------------------------------------------

    public function index($lang_admin = 'es') {
        $this->form_validation->set_rules('text', 'Texto', 'trim');
        $this->form_validation->set_rules('footer', 'Texto de footer', 'trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }

            $data = $this->ask_model->where('lang', $lang_admin)->limit(1)->get_all();
            $allies = $this->db->where('lang', $lang_admin)->get('ask_allies')->result();

            $this->template->set('data', $data[0])
                    ->set('allies', $allies)
                    ->set('lang_admin', $lang_admin)
                    ->build('admin/ask_back');
        } else { // si el formulario ha sido enviado con Ã©xito se procede
            $post = (object) $this->input->post();

            $data = array(
                'footer' => $post->footer,
                'text1' => $post->text1,
                'title1' => $post->title1,
                'text2' => $post->text2,
                'title2' => $post->title2,
                'text' => html_entity_decode($post->text),
                'lang' => $lang_admin,
            );

            if ($this->db->where('lang', $lang_admin)->update('ask', $data)) {
                // insert ok, so
                $this->session->set_flashdata('success', lang('ask:success_message'));
            } else {
                $this->session->set_flashdata('error', lang('ask:error_message'));
            }
            redirect('admin/ask/index/' . $lang_admin);
        }
    }

    public function edit_allies($idItem = null, $lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('name', 'Título', 'trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            if (!empty($idItem)) {  // si se envia un dato por la URL se hace lo siguiente (Edita)
                // colocamos el titulo
                $titulo = 'Editar';
                // cargamos los datos
                $dataForm = $this->db->where('id', $idItem)->get('ask_allies')->row();

                // mandamos los datos al template
                $this->template
                        ->set('dataForm', $dataForm)
                        ->set('titulo', $titulo)
                        ->set('lang_admin', $lang_admin)
                        ->build('admin/edit_allies_back');
            } else {
                // colocamos el titulo
                $titulo = 'Crear';
                // mandamos los datos al template
                $this->template
                        ->set('titulo', $titulo)
                        ->set('lang_admin', $lang_admin)
                        ->build('admin/edit_allies_back');
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin;
            $data = $_POST; // guardamos los datos del post
            if (!empty($idItem)) {  // si se envia un dato por la URL se hace lo siguiente (Edita)
                // configuracion de la libreria upload
                $config['upload_path'] = './' . UPLOAD_PATH . '/ask';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 2050;
                $config['encrypt_name'] = true;

                // cargamos la libreria upload
                $this->load->library('upload', $config);

                // imagen uno
                $img = $_FILES['image']['name'];
                
                // si la imagen no esta vacía la guardamos, y la guardamos en el array data
                if (!empty($img)) {
                    if ($this->upload->do_upload('image')) {
                        $datos = array('upload_data' => $this->upload->data());
                        $path = UPLOAD_PATH . 'ask/' . $datos['upload_data']['file_name'];
                        $img = array('image' => $path);
                        $data = array_merge($data, $img);
                        $obj = $this->db->where('id', $idItem)->get('ask_allies')->row();
                        @unlink($obj->image);
                    } else {
                        $this->session->set_flashdata('error', $this->upload->display_errors());
                        redirect('admin/ask/index/' . $lang_admin);
                    }
                }
                
                // actualizamos los datos
                if ($this->db->where('id', $idItem)->update('ask_allies', $data)) {
                    $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                    redirect('admin/ask/index/' . $lang_admin);
                } else {
                    $this->session->set_flashdata('success', lang('home:error_message'));
                    redirect('admin/ask/edit_allies/' . $idItem . '/' . $lang_admin);
                }
            } else {
                // configuracion de la libreria upload
                $config['upload_path'] = './' . UPLOAD_PATH . '/ask';
                $config['allowed_types'] = 'gif|jpg|png|jpeg';
                $config['max_size'] = 2050;
                $config['encrypt_name'] = true;

                // cargamos la libreria upload
                $this->load->library('upload', $config);

                // imagen uno
                $img = $_FILES['image']['name'];

                // si la imagen no esta vacía la guardamos, y la guardamos en el array data
                if (!empty($img)) {
                    if ($this->upload->do_upload('image')) {
                        $datos = array('upload_data' => $this->upload->data());
                        $path = UPLOAD_PATH . 'ask/' . $datos['upload_data']['file_name'];
                        $img = array('image' => $path);
                        $data = array_merge($data, $img);
                    } else {
                        $this->session->set_flashdata('error', $this->upload->display_errors());
                        redirect('admin/ask/index/' . $lang_admin);
                    }
                }
                
                // insertamos en la base de datos
                if ($this->db->insert('ask_allies', $data)) {
                    $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                    redirect('admin/ask/index/' . $lang_admin);
                } else {
                    $this->session->set_flashdata('success', lang('home:error_message'));
                    return $this->nuevo_destacado();
                }
            }
        }
    }

    public function delete_allies($id = null, $lang = "es") {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/ask/index/'.$lang.'/#page-allies');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'ask_allies')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('ask_allies')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/ask/index/'.$lang.'/#page-allies');
    }

}
