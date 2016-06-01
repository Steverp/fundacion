<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Christian España
 */
class work_with_us extends Public_Controller {

    public function __construct() {
        parent::__construct();
         $models = array('work_with_us_m', 'work_with_us_emails_m');
        $this->load->model($models);
        
        Asset::add_path('contact_us', 'addons/shared_addons/modules/contact_us/');

        $this->template
                ->append_js('contact_us::jquery_validate.js')
                ->append_js('contact_us::formvalidate.js');
    }

    // -----------------------------------------------------------------

    public function index()
    {
        // Datos de Contacto
        $_work_with_us = $this->work_with_us_m->get_all();
        $work_with_us = array();
        if (count($_work_with_us) > 0)
		{
            $work_with_us = $_work_with_us[0];
        }

        $this->template
                ->set('work_with_us', $work_with_us)
                ->build('work_with_us_front');
    }

    /*
     *Enviar correo
     */
    function send()
    {
        $this->form_validation->set_rules('name', 'Nombre y Apellido', 'required|trim|max_length[100]');
        $this->form_validation->set_rules('email', 'Correo', 'required|trim|valid_email|max_length[100]');
        $this->form_validation->set_rules('phone', 'Teléfono', 'trim|max_length[30]');
        $this->form_validation->set_rules('cell', 'Celular', 'trim|max_length[30]');
        $this->form_validation->set_rules('company', 'Empresa/Organización', 'trim|max_length[100]');
        $this->form_validation->set_rules('message', 'Mensaje', 'required|trim|max_length[455]');
		
		$statusJson = 'error';
		$msgJson = 'Por favor intenta de mas tarde';
		
        if ($this->form_validation->run() === TRUE)
        {
			$_work_with_us = $this->work_with_us_m->get_all();
			$work_with_us = array();
			if (count($_work_with_us) > 0)
			{
				$work_with_us = $_work_with_us[0];
			}
	       	$post = (object) $this->input->post(null);

            $data = array(
                'name' => $post->name,
                'email' => $post->email,
                'phone' => $post->phone,
                'cell' => $post->cell,
                'company' => $post->company,
                'message' => $post->message,
            );
			
			// Se carga la imagen
	        $config['upload_path'] = './' . UPLOAD_PATH . '/work_with_us';
	        $config['allowed_types'] = 'doc|docx|txt|pdf|xls|xlsx';
	        $config['max_size'] = 2050;
	        $config['encrypt_name'] = true;
	
	        $this->load->library('upload', $config);
			
	        // imagen uno
	        $img = $_FILES['file']['name'];
	        $file = array();
			$path = '';
	        if (!empty($img)) {
	            if ($this->upload->do_upload('file'))
	            {
	                $datos = array('upload_data' => $this->upload->data());
	                $path = UPLOAD_PATH . 'work_with_us/' . $datos['upload_data']['file_name'];
					$file = array('file' => $path);
                    $data = array_merge($data, $file);
	            } else {
	                $this->session->set_flashdata('error', $this->upload->display_errors());
	                redirect(base_url().'work_with_us');
	            }
	        }
			
            //Validate sendmail
            if( $this->work_with_us_emails_m->insert($data))
            {
            	// se envia el correo al administrador
				$this->send_email_to_user($data, $work_with_us->email, $path);
				// se envia el correo a la persona encargada de la pág
				$this->send_email_to_register($data, $work_with_us->email, $path);
				$statusJson = 'success';
				$msgJson = 'Su mensaje ha sido enviado';
            }
            else
            {
                $statusJson = 'error';
				$msgJson = 'Error Mailing, Contact the Webmaster';
            }
        } else
        {
			$statusJson = 'error';
			$msgJson = validation_errors();
        }
		$this->session->set_flashdata($statusJson, $msgJson);
		redirect(base_url().'work_with_us');
    }
	
	/**
	 * Send an email
	 *
	 * @param array $comment The comment data.
	 * @param array $entry The entry data.
	 * @return boolean 
	 */
	private function send_email_to_user($data, $admin_email, $path)
	{
		$this->load->library('email');
		Events::trigger('email', array(
			'name' => $data['name'],
			'email' => $data['email'],
			'phone' => $data['phone'],
			'company' => $data['company'],
			'message' => $data['message'],
			'slug' => 'work_with_us',
			'attach' => array( 0 => $path),
			/*'email' => Settings::get('contact_email'), // se manda el correo a al de la configuración del pyro*/
			'to' => $admin_email,
		), 'array');
	}
	
	// envia un correo a la persona que registro la hoja de vida
	private function send_email_to_register($data, $admin_email, $path)
	{
		$this->load->library('email');
		Events::trigger('email', array(
			'name' => $data['name'],
			'email' => $data['email'],
			'phone' => $data['phone'],
			'company' => $data['company'],
			'message' => $data['message'],
			'slug' => 'work_with_us_register',
			'attach' => array( 0 => $path),
			/*'email' => Settings::get('contact_email'), // se manda el correo a al de la configuración del pyro*/
			'to' => $data['email'],
		), 'array');
	}
}