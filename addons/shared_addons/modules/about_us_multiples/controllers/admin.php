<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	Luis Fernando Salazar Buitrago
 * @author 	Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	about_us_multiples
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('about_us_multiples');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array('about_us_multiples_m', 'work_team_m');
        $this->load->model($models);
    }

    public function index($lang_admin = 'es') {
        $work_team = $this->work_team_m
                ->order_by('id', 'DESC')
                ->where('lang', $lang_admin)
                ->get_all();

        // Consultamos los datos del slider de Clientes
        $slide = $this->db->get('about_us_slide')->result();

        // Consultamos los datos del slider de Clientes
        $partners = $this->db->get('about_us_partners')->result();

        $intro = $this->db->get('about_us_intro')->row();

        $this->template
                ->set('work_team', $work_team)
                ->set('slide', $slide)
                ->set('partners', $partners)
                ->set('intro', $intro)
                ->set('lang_admin', $lang_admin)
                ->build('admin/about_us_multiple_back');
    }

    /*
     * Intro
     */

    public function edit_text_intro() {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-text-intro');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable

            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', 1)->get('about_us_intro')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/about_us_multiples/index/#page-text-intro');
                }
            }

            // actualizamos el registro
            if ($this->db->where('id', 1)->update('about_us_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/about_us_multiples/index/#page-text-intro');
        }
    }

    /*
     * Panel de texto
     */

    public function create_customers() {
        // colocamos el titulo
        $titulo = 'Crear';
        // mandamos los datos al template
        $this->template
                ->set('titulo', $titulo)
                ->build('admin/create_customers_back');
    }

    public function store_customers() {
        // reglas de validación
        $this->form_validation->set_rules('link', 'Link', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            $action = $_POST['btnAction'];  // guardamos el valor del submit
            unset($_POST['btnAction']); // borramos el valor del submit
            $data = $_POST; // guardamos los datos que se enviaron por el post
            // configuración de la libreria uploads
            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            // si la imagen no esta vacía la guardamos y la agregamos al array
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // insertamos el registro
            if ($this->db->insert('about_us_slide', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/about_us_multiples/#page-banner-customers');
            } else {
                $this->session->set_flashdata('error', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function edit_customers($idItem = null) {
        // colocamos el titulo
        $titulo = 'Editar';
        // cargamos los datos
        $dataForm = $this->db->where('id', $idItem)->get('about_us_slide')->row();
        // mandamos los datos al template
        $this->template
                ->set('dataForm', $dataForm)
                ->set('titulo', $titulo)
                ->build('admin/edit_customers_back');
    }

    public function update_customers($idItem = null) {
        // reglas de validación
        $this->form_validation->set_rules('link', 'Link', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            $action = $_POST['btnAction'];  // guardamos el valor del submit
            unset($_POST['btnAction']); // borramos el valor del submit
            $data = $_POST; // guardamos los datos que se enviaron por el post
            // configuración de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            // si la imagen no esta vacía, la guardamos y la agregamos al array
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('about_us_slide')->row();
                    @unlink($obj->imagen);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('about_us_slide', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/about_us_multiples/#page-banner-customers');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function delete_customers($id = null) {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/about_us_multiples/#page-banner-customers');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'about_us_slide')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('about_us_slide')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/about_us_multiples/#page-banner-customers');
    }

    /*
     * Nuestros asociados
     */
    
    public function edit_partners_intro() {
        // reglas de validación
        $this->form_validation->set_rules('title2', 'Titulo', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-banner-partners');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable

            // actualizamos el registro
            if ($this->db->where('id', 1)->update('about_us_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/about_us_multiples/index/#page-banner-partners');
        }
    }
    
    public function create_partners() {
        // colocamos el titulo
        $titulo = 'Crear Partner';
        // mandamos los datos al template
        $this->template
                ->set('titulo', $titulo)
                ->build('admin/create_partners_back');
    }

    public function store_partners() {
        // reglas de validación
        $this->form_validation->set_rules('link', 'Link', 'valid_url');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            $action = $_POST['btnAction'];  // guardamos el valor del submit
            unset($_POST['btnAction']); // borramos el valor del submit
            $data = $_POST; // guardamos los datos que se enviaron por el post
            // configuración de la libreria uploads
            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            // si la imagen no esta vacía la guardamos y la agregamos al array
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // insertamos el registro
            if ($this->db->insert('about_us_partners', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/about_us_multiples/#page-banner-partners');
            } else {
                $this->session->set_flashdata('error', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function edit_partners($idItem = null) {
        // colocamos el titulo
        $titulo = 'Editar Partner';
        // cargamos los datos
        $dataForm = $this->db->where('id', $idItem)->get('about_us_partners')->row();
        // mandamos los datos al template
        $this->template
                ->set('dataForm', $dataForm)
                ->set('titulo', $titulo)
                ->build('admin/edit_partners_back');
    }

    public function update_partners($idItem = null) {
        // reglas de validación
        $this->form_validation->set_rules('link', 'Link', 'valid_url');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            $action = $_POST['btnAction'];  // guardamos el valor del submit
            unset($_POST['btnAction']); // borramos el valor del submit
            $data = $_POST; // guardamos los datos que se enviaron por el post
            // configuración de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            // si la imagen no esta vacía, la guardamos y la agregamos al array
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('about_us_partners')->row();
                    @unlink($obj->imagen);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('about_us_partners', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/about_us_multiples/#page-banner-partners');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function delete_partners($id = null) {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/about_us_multiples/#page-banner-partners');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'about_us_partners')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('about_us_partners')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/about_us_multiples/#page-banner-partners');
    }

    /*
     * Certificaciones
     */
    
    public function edit_team_intro() {
        // reglas de validación
        $this->form_validation->set_rules('title3', 'Titulo', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-about_us_work_team');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable
            // actualizamos el registro
            if ($this->db->where('id', 1)->update('about_us_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/about_us_multiples/index/#page-about_us_work_team');
        }
    }

    public function new_work_team($lang_admin = 'es') {

        $titulo = 'Nuevo';
        $this->template
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_work_team');
    }

    public function edit_work_team($idItem = null, $lang_admin = 'es') {
        $idItem or redirect('admin/about_us_multiples/#page-about_us_work_team');
        $titulo = 'Editar';
        $datosForm = $this->work_team_m->get($idItem);
        $this->template
                ->set('datosForm', $datosForm)
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_work_team');
    }

    public function update_work_team($idItem = null, $lang_admin = 'es') {
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        if ($this->form_validation->run() == TRUE) {
            $post = (object) $this->input->post();

            $data = array(
                'link' => $post->link,
                'lang' => $lang_admin,
            );

            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('work_team')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/about_us_multiples/index/' . $lang_admin . '#page-about_us_work_team');
                }
            }

            if ($this->work_team_m->update($idItem, $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/about_us_multiples/index/' . $lang_admin . '#page-about_us_work_team');
        } else {

            $this->session->set_flashdata('error', validation_errors());
            $this->edit_work_team($idItem, $lang_admin);
        }
    }

    public function create_work_team($lang_admin = 'es') {
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        if ($this->form_validation->run() == TRUE) {

            $post = (object) $this->input->post();

            $data = array(
                'link' => $post->link,
                'lang' => $lang_admin,
            );

            $config['upload_path'] = './' . UPLOAD_PATH . '/about_us_multiples';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'about_us_multiples/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/about_us_multiples/index/' . $lang_admin . '#page-about_us_work_team');
                }
            }

            if ($this->work_team_m->insert($data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/about_us_multiples/index/' . $lang_admin . '#page-about_us_work_team');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            $this->new_work_team($lang_admin);
        }
    }

    public function delete_work_team($id = null, $lang_admin = 'es') {
        $id or redirect('admin/about_us_multiples/' . $lang_admin . '#page-about_us_work_team');

        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'work_team')->row();

        if ($this->work_team_m->delete($id)) {
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, intentelo nuevamente');
        }

        redirect('admin/about_us_multiples/index/' . $lang_admin . '#page-about_us_work_team');
    }

}
