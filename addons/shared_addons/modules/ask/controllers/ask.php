<?php

/**
 *
 * @author 	    Brayan Acebo
 * @subpackage 	Sobre Nosotros
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class ask extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $models = array(
            'ask_model',
            'ask_mail'
        );
        $this->load->model($models);
        $this->template
                ->append_js('module::jquery_validate.js')
                ->append_js('module::formvalidate.js');

        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
    }

    // ------------------------------------------------------------------------

    function index() {
        $lang = $this->lang_code;
        $data = $this->ask_model->where('lang', $lang)->get_all();

        $post = array();

        if (count($data) > 0) {
            $post = $data[0];
        }

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'video' => $post->video
        );

        $data_end = array_merge((array) $post, $setter);
        
        $allies = $this->db->where('lang', $lang)->get('ask_allies')->result();
        
        $c = 1;
        
        foreach ($allies as $all){
            if($c == 1){
                $all->uno = "consultant-active";
            }else{
                $all->uno = "";
            }
            $c++;
        }
        
        $this->template
                ->title($this->module_details['name'])
                ->set_breadcrumb('Sobre Nosotros')
                ->set('data', (object) $data_end)
                ->set('allies', $allies)
                ->set('lang', $lang)
                ->build('index');
    }
    
    function send() {
        $this->form_validation->set_rules('type', 'Tipo de Consultoria', 'trim');

        $statusJson = 'error';
        $msgJson = 'Por favor intenta de mas tarde';

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post(null);

            $email = $this->db->where('id', 1)->get('contact_us')->row();

            // si el correo viene separado por ,
            if (count($email) > 0) {
                $email = $email->email;
            }
            setlocale(LC_ALL, "es");
            date_default_timezone_set('America/Bogota');
            
            
            $type = $this->db->where('id', $post->type)->get('ask_allies')->row();
            
            $data['post'] = array(
                'place' => $post->place,
                'type' => $type->name,
                'message' => $post->message,
                'date' => date('Y-m-d H:i:s')
            );
            
//            echo "<pre>";
//            var_dump($email);die;

            //Validate sendmail
            if ($this->ask_mail->insert($data['post'])) {
                
                if (strpos($email, ',') !== false && !empty($emails) && count($emails) > 0) {
                    foreach ($emails AS $row => $value) {
                        $this->send_email_to_user($data['post'], $value);
                    }
                } else {
                    $this->send_email_to_user($data['post'], $email);
                }

                $statusJson = '';
                $msgJson = 'Su mensaje ha sido enviado';
            } else {
                $statusJson = 'error';
                $msgJson = 'Error Mailing, Contact the Webmaster';
            }
        } else {
            $statusJson = 'error';
            $msgJson = validation_errors();
        }
        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }

    /**
     * Send an email
     *
     * @param array $comment The comment data.
     * @param array $entry The entry data.
     * @return boolean 
     */
    private function send_email_to_user($data, $admin_email) {
        $this->load->library('email');
        $this->load->library('user_agent');

        Events::trigger('email', array(
            'place' => $data['place'],
            'type' => $data['type'],
            'message' => $data['message'],
            'slug' => 'pregunta',
            'to' => $admin_email,
                ), 'array');
    }

}

?>