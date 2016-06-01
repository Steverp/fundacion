<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @author 	Luis Fernando Salazar
 * @author 	Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	Home Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        // cargamos el lenguaje
        $this->lang->load('home');
        // añadimos atributos al template
        $this->template->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
    }

    public function index($lang_admin = 'es') {
        // consultamos los datos del Banner
        $banner = $this->db->where('lang', $lang_admin)->get('home_banner')->result();

        // consultamos los datos de Historia en numeros
        $numbers = $this->db->where('lang', $lang_admin)->get('history_numbers')->result();

        // consultamos los datos de Historia en numeros
        $links = $this->db->where('lang', $lang_admin)->get('home_links')->result();
        $linkintro = $this->db->where('lang', $lang_admin)->get('home_links_intro')->row();

        // consultamos los datos de Servicios Destacadas
        $video = $this->db->where('lang', $lang_admin)->get('home_video_info')->row();

        // Consultamos los datos del slider de Clientes
        $people = $this->db->where('lang', $lang_admin)->get('people')->result();

        // agregamos los atributos al template
        $this->template
                ->set('banner', $banner)
                ->set('numbers', $numbers)
                ->set('video', $video)
                ->set('people', $people)
                ->set('links', $links)
                ->set('linkintro', $linkintro)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }

    /*
     * BANNER
     */
    
    public function edit_banner_info($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('linkbanner', 'Link', 'valid_url|trim');
        $this->form_validation->set_rules('titlelinkbanner', 'Titulo de link', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-banner');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable
            
            // actualizamos el registro
            if ($this->db->where('lang', $lang_admin)->update('home_links_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/home/index/' . $lang_admin . '/#page-banner');
        }
    }

    public function create_banner($lang_admin = 'es') {
        // colocamos el titulo
        $titulo = 'Crear';
        // mandamos los datos al template
        $this->template
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_banner_back');
    }

    public function store_banner($lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('title', 'Título', 'trim');
        $this->form_validation->set_rules('text', 'Texto', 'trim');
        $this->form_validation->set_rules('link', 'Link', 'valid_url');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el valor del idioma
            $data = $_POST; // guardamos los datos del post
            // configuracion de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/home_banner';
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
                    $path = UPLOAD_PATH . 'home_banner/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/home/index/' . $lang_admin);
                }
            }

            // insertamos en la base de datos
            if ($this->db->insert('home_banner', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/home/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                return $this->nuevo_destacado();
            }
        }
    }

    public function edit_banner($idItem = null, $lang_admin = 'es') {
        // colocamos el titulo
        $titulo = 'Editar';
        // cargamos los datos
        $banner = $this->db->where('id', $idItem)->get('home_banner')->row();

        // mandamos los datos al template
        $this->template
                ->set('banner', $banner)
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_banner_back');
    }

    public function update_banner($idItem = null, $lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('title', 'Título', 'trim');
        $this->form_validation->set_rules('text', 'Texto', 'trim');
        $this->form_validation->set_rules('link', 'Link', 'valid_url');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el valor del idioma
            $data = $_POST; // guardamos los datos del post
            // configuracion de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/home_banner';
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
                    $path = UPLOAD_PATH . 'home_banner/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('home_banner')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/home/index/' . $lang_admin);
                }
            }
            // actualizamos los datos
            if ($this->db->where('id', $idItem)->update('home_banner', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/home/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                redirect('admin/home/edit_banner/' . $idItem . '/' . $lang_admin);
            }
        }
    }

    public function delete_banner($id = null) {
        // si no existe el id volvemos al index
        $id or redirect('admin/home/');

        // guardamos los datos del banner
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'home_banner')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('home_banner')) {
            // borramos la imaen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/home/');
    }

    /*
     * Links destacados
     */

    public function edit_link_info($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-video-info');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable
            // configuración de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/home_links_intro';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = '10000000';
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // Logo
            $logo = $_FILES['logo']['name'];

            // si la imagen no esta vacía, la guardamos y la agregamos al array
            if (!empty($logo)) {
                if ($this->upload->do_upload('logo')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'home_links_intro/' . $datos['upload_data']['file_name'];
                    $logo = array('logo' => $path);
                    $data = array_merge($data, $logo);
                    $obj = $this->db->where('id', $idItem)->get('home_links_intro')->row();
                    @unlink($obj->logo);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // actualizamos el registro
            if ($this->db->where('lang', $lang_admin)->update('home_links_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/home/index/' . $lang_admin . '/#page-links');
        }
    }

    public function create_link($lang_admin = 'es') {
        // colocamos el titulo dependiendo del tipo
        $titulo = 'Crear';

        // mandamos los datos al template
        $this->template
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_links_back');
    }

    public function store_links($lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // sacamos del array el valor del submit
            // cargamos los datos del formulario en una variable
            $data = $_POST;
            $data['lang'] = $lang_admin;

            // insertamos los datos
            if ($this->db->insert('home_links', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/home/#page-links');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                return $this->nuevo_destacado();
            }
        }
    }

    public function edit_links($idItem = null, $lang_admin = 'es') {
        // colocamos el titulo dependiendo del tipo
        $titulo = 'Editar';
        // cargamos los datos
        $outstanding = $this->db->where('id', $idItem)->get('home_links')->row();

        // mandamos los datos al template
        $this->template
                ->set('outstanding', $outstanding)
                ->set('titulo', $titulo)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_links_back');
    }

    public function update_links($idItem = null, $lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('title', 'Título', 'trim');
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // sacamos del array el valor del submit
            // cargamos los datos del formulario en una variable
            $data = $_POST;
            $data['lang'] = $lang_admin;

            // actualizamos los datos
            if ($this->db->where('id', $idItem)->update('home_links', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/home/#page-links');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                return $this->editar_destacado();
            }
        }
    }

    public function delete_links($id = null) {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/home/#page-links');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'home_links')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('home_links')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/home/#page-links');
    }

    /*
     * text info
     */

    public function edit_video_info($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('text', 'Text', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-video-info');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable
            // configuración de la libreria upload
            $config['upload_path'] = './' . UPLOAD_PATH . '/home_video_info';
            $config['allowed_types'] = 'gif|jpg|png|jpeg|mp4';
            $config['max_size'] = '10000000';
            $config['encrypt_name'] = true;

            // cargamos la libreria uploads
            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            // si la imagen no esta vacía, la guardamos y la agregamos al array
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'home_video_info/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('home_video_info')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // video
            $video = $_FILES['video']['name'];

            // si la imagen no esta vacía, la guardamos y la agregamos al array
            if (!empty($video)) {
                if ($this->upload->do_upload('video')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'home_video_info/' . $datos['upload_data']['file_name'];
                    $video = array('video' => $path);
                    $data = array_merge($data, $video);
                    $obj = $this->db->where('id', $idItem)->get('home_video_info')->row();
                    @unlink($obj->video);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // actualizamos el registro
            if ($this->db->where('lang', $lang_admin)->update('home_video_info', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            if ($_POST['title1']) {
                redirect('admin/home/index/' . $lang_admin . '/#page-numbers');
            } else {
                redirect('admin/home/index/' . $lang_admin . '/#page-video-info');
            }
        }
    }

    /*
     * areas de especialidad
     */

    public function edit_text_info($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('text', 'Text', 'trim');

        // abrimos el formulario de edicion
        if ($this->form_validation->run() !== TRUE) {
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            redirect('admin/home/#page-text-info');
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el dato del idioma
            $data = $_POST; // guardamos los datos del post en una variable
            // actualizamos el registro
            if ($this->db->where('lang', $lang_admin)->update('home_text_info', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
            }
            redirect('admin/home/index/' . $lang_admin . '/#page-text-info');
        }
    }

    public function edit_numbers($idItem = null, $lang_admin = 'es') {
        // Reglas de validación
        $this->form_validation->set_rules('title', 'Título', 'trim');
        $this->form_validation->set_rules('text', 'Texto', 'trim');
        $this->form_validation->set_rules('link', 'Link', 'valid_url|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
            if (!empty($idItem)) {  // si se envia un dato por la URL se hace lo siguiente (Edita)
                // colocamos el titulo dependiendo del tipo
                $titulo = 'Editar';
                // cargamos los datos
                $outstanding = $this->db->where('id', $idItem)->get('history_numbers')->row();

                // mandamos los datos al template
                $this->template
                        ->set('outstanding', $outstanding)
                        ->set('titulo', $titulo)
                        ->set('lang_admin', $lang_admin)
                        ->build('admin/edit_numbers_back');
            } else {
                // colocamos el titulo dependiendo del tipo
                $titulo = 'Crear';

                // mandamos los datos al template
                $this->template
                        ->set('titulo', $titulo)
                        ->set('lang_admin', $lang_admin)
                        ->build('admin/edit_numbers_back');
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // sacamos del array el valor del submit
            // cargamos los datos del formulario en una variable
            $data = $_POST;
            $data['lang'] = $lang_admin;
            if (!empty($idItem)) {  // si se envia un dato por la URL se hace lo siguiente (Edita)
                // // configuración de la libreria upload
                $config['upload_path'] = './' . UPLOAD_PATH . '/home_customers';
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
                        $path = UPLOAD_PATH . 'home_customers/' . $datos['upload_data']['file_name'];
                        $img = array('image' => $path);
                        $data = array_merge($data, $img);
                        $obj = $this->db->where('id', $idItem)->get('history_numbers')->row();
                        @unlink($obj->imagen);
                    } else {
                        $this->session->set_flashdata('error', $this->upload->display_errors());
                        header('Location: ' . $_SERVER['REQUEST_URI']);
                    }
                }
                // actualizamos los datos
                if ($this->db->where('id', $idItem)->update('history_numbers', $data)) {
                    $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                    redirect('admin/home/#page-numbers');
                } else {
                    $this->session->set_flashdata('success', lang('home:error_message'));
                    return $this->editar_destacado();
                }
            } else {
                // configuración de la libreria uploads
                $config['upload_path'] = './' . UPLOAD_PATH . '/home_customers';
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
                        $path = UPLOAD_PATH . 'home_customers/' . $datos['upload_data']['file_name'];
                        $img = array('image' => $path);
                        $data = array_merge($data, $img);
                    } else {
                        $this->session->set_flashdata('error', $this->upload->display_errors());
                        header('Location: ' . $_SERVER['REQUEST_URI']);
                    }
                }

                // insertamos los datos
                if ($this->db->insert('history_numbers', $data)) {
                    $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                    redirect('admin/home/#page-numbers');
                } else {
                    $this->session->set_flashdata('success', lang('home:error_message'));
                    return $this->nuevo_destacado();
                }
            }
        }
    }

    public function delete_numbers($id = null) {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/home/#page-numbers');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'history_numbers')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('history_numbers')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/home/#page-numbers');
    }

    /*
     * Nuestros clientes
     */
    
    public function create_people() {
        // colocamos el titulo
        $titulo = 'Crear';
        // mandamos los datos al template
        $this->template
                ->set('titulo', $titulo)
                ->build('admin/create_people_back');
    }

    public function store_people() {
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
            $config['upload_path'] = './' . UPLOAD_PATH . '/people';
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
                    $path = UPLOAD_PATH . 'people/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // insertamos el registro
            if ($this->db->insert('people', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/home/#page-people');
            } else {
                $this->session->set_flashdata('error', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function edit_people($idItem = null) {
        // colocamos el titulo
        $titulo = 'Editar';
        // cargamos los datos
        $dataForm = $this->db->where('id', $idItem)->get('people')->row();
        // mandamos los datos al template
        $this->template
                ->set('dataForm', $dataForm)
                ->set('titulo', $titulo)
                ->build('admin/edit_people_back');
    }

    public function update_people($idItem = null) {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'trim');
        $this->form_validation->set_rules('text', 'Texto', 'trim');

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
            $config['upload_path'] = './' . UPLOAD_PATH . '/people';
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
                    $path = UPLOAD_PATH . 'people/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $idItem)->get('people')->row();
                    @unlink($obj->imagen);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    header('Location: ' . $_SERVER['REQUEST_URI']);
                }
            }

            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('people', $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/home/#page-people');
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                header('Location: ' . $_SERVER['REQUEST_URI']);
            }
        }
    }

    public function delete_people($id = null) {
        // si no se recibe el id lo mandamos al index
        $id or redirect('admin/home/#page-people');

        // consultamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'people')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('people')) {
            // borramos la imagen
            @unlink($obj->image);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/home/#page-people');
    }
    
}
