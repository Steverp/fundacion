<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Luis Fernando Salazar
 */
class Contact_Us extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $models = array(
            'contact_us_m',
            'contact_us_emails_m',
            'google_map_model',
            'google_map_category_model'
        );

        $this->load->model($models);
        $this->lang->load('language');
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

    // -----------------------------------------------------------------



    public function index() {
        // Datos de Contacto
        $_contact_us = $this->contact_us_m->where('lang', $this->lang_code)->get_all();
        $contact_us = array();
        if (count($_contact_us) > 0) {
            $contact_us = $_contact_us[0];
        }

        
        $emails_area = $this->db->get("contact_us_emails_area")->result();
        $json_info_content = array();
        $json_markers = array();

        $selectGoogleMaps = $this->contact_us_m->sqlFormSelect('google_map_categories', 'id', 'title', FALSE, 'outstanding', '1', $this->lang_code);
        $moduleName = 'google_maps';

        if (!empty($selectGoogleMaps)) {
            foreach ($selectGoogleMaps AS $item => $value) {
                $idCategory = $item;
                break;
            }

            $google_map = $this->db
                            ->select('*')
                            ->from('google_maps AS gm')
                            ->join('google_maps_categories AS gc', 'gc.google_map_id = gm.id', 'left')
                            ->where('gc.category_id', $idCategory)
                            ->get()->result();

            // datos para el mapa de google			
            $json_markers = array();
            $json_info_content = array();

            if (!empty($google_map)) {
                foreach ($google_map AS $item) {
                    $item->image = val_image($item->image);
                    array_push($json_markers, array($item->adress . ', ' . $item->name, (double) $item->coordinate1, (double) $item->coordinate2));

                    $imageTogoogle = str_replace(site_url() . 'uploads/default/' . $moduleName . '/', "", $item->image);

                    array_push($json_info_content, array('image' => $imageTogoogle, 'adress' => $item->adress, 'title' => $item->name, 'moduleName' => $moduleName, 'schedule' => $item->schedule, 'description' => $item->description));
                }
            }

            // mandamos los puntos
            $json_markers = json_encode($json_markers);


            // sacamos solo el nombre de la imagen
            // mandamos los datos para el modal dentro del mapa
            $json_info_content = json_encode($json_info_content);
        }

        $this->template
                ->append_js('module::google_maps.js')
                ->set('json_info_content', $json_info_content)
                ->set('json_markers', $json_markers)
                ->set('contact_us', $contact_us)
                ->set('selectGoogleMaps', $selectGoogleMaps)
                ->set('emails_area', $emails_area)
                ->build('contact_us_front');
    }

    /*
     * Enviar correo
     */

    function send() {
        $this->form_validation->set_rules('name', 'Nombre y Apellido', 'required|trim|max_length[100]');
        $this->form_validation->set_rules('email', 'Correo', 'required|trim|valid_email|max_length[100]');
        $this->form_validation->set_rules('cell', 'Celular', 'trim|max_length[30]');
        $this->form_validation->set_rules('company', 'Empresa/Organización', 'trim|max_length[100]');
        $this->form_validation->set_rules('message', 'Mensaje', 'required|trim|max_length[455]');

        $statusJson = 'error';
        $msgJson = 'Por favor intenta de mas tarde';

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post(null);
            
            $email = $this->db->where('id', '1')->get('contact_us')->row();

            // si el correo viene separado por ,
            if (count($email) > 0) {
                $email = $email->email;
                if (strpos($email, ',') !== false) {
                    $emails = explode(",", $email);
                }
            }
            setlocale(LC_ALL, "es");
            date_default_timezone_set('America/Bogota');

            $data['post'] = array(
                'name' => $post->name,
                'email' => $post->email,
                'phone' => $post->phone,
                'city' => $post->city,
                'company' => $post->company,
                'message' => $post->message,
                'date' => date('Y-m-d H:i:s'),
                'lang' => $this->lang_code
            );

            //Validate sendmail
            if ($this->contact_us_emails_m->insert($data['post'])) {
               
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
            'name' => 'Escala Urbana',
            'nombre' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'company' => $data['company'],
            'city' => $data['city'],
            'message' => $data['message'],
            'slug' => 'contact',
            'to' => $admin_email,
                ), 'array');
    }
    
    /*
     * Enviar QUIZ
     */

    function quiz() {
        $this->form_validation->set_rules('id_subject', 'Asunto', 'required');
        $this->form_validation->set_rules('comment', 'Comentario', 'required|trim');

        $statusJson = 'error';
        $msgJson = 'Por favor intenta de mas tarde';

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post(null);
            
            $email = $this->db->where('id', '1')->get('contact_us')->row();

            // si el correo viene separado por ,
            if (count($email) > 0) {
                $email = $email->email;
                if (strpos($email, ',') !== false) {
                    $emails = explode(",", $email);
                }
            }
            setlocale(LC_ALL, "es");
            date_default_timezone_set('America/Bogota');
            
            $subject = $this->db->where('id', $post->id_subject)->get('contact_us_emails_area')->row()->title;
            
            $data = array(
                'id_subject' => $subject,
                'comment' => $post->comment,     
            );

            //Validate sendmail
            if ($this->db->insert('quiz',$data)) {
               
                if (strpos($email, ',') !== false && !empty($emails) && count($emails) > 0) {
                    foreach ($emails AS $row => $value) {
                        $this->send_email_quiz($data, $value);
                    }
                } else {
                    $this->send_email_quiz($data, $email);
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
    private function send_email_quiz($data, $admin_email) {
        $this->load->library('email');
        $this->load->library('user_agent');

        Events::trigger('email', array(
            'name' => 'coldpack',
            'nombre' => $data['id_subject'],
            'comment' => $data['comment'],
            'slug' => 'quiz-notification',
            'to' => $admin_email,
                ), 'array');
    }

}
