<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @author 	Luis Fernando Salazar Buitrago
 * @author  Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	Home Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Home extends Public_Controller {

    public function __construct() {
        parent::__construct();
        /* idioma */
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $_SESSION['lang_code'] = 'es';
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
    }

    // -----------------------------------------------------------------

    public function index() {
        
        $lang = $this->lang_code;
        
        // consultamos los datos del Banner
        $banner = $this->db->where('lang', $lang)->get('home_banner')->result();
        
        foreach ($banner as $b){
            $b->linki = $this->db->where('lang', $lang)->get('home_links_intro')->row();
        }
        
        //Links destacados
        $links = $this->db->where('lang', $lang)->get('home_links')->result();
        $linkintro = $this->db->where('lang', $lang)->get('home_links_intro')->row();
        
        // consultamos los datos de Numeros
        $numbers = $this->db->where('lang', $lang)->get('history_numbers')->result();

        // consultamos los datos de videos
        $video = $this->db->where('lang', $lang)->get('home_video_info')->row();
        
        // Consultamos los datos del slider de Clientes
        $people = $this->db->where('lang', $lang)->get('people')->result();
        
        // agregamos los atributos al template
        $this->template
                ->set('banner', $banner)
                ->set('links', $links)
                ->set('linkintro', $linkintro)
                ->set('video', $video)
                ->set('numbers', $numbers)
                ->set('people', $people)
                ->set('lang', $lang)
                ->title('Inicio')
                ->build('index');
    }

    public function change_lenguage($lang) {
        $this->session->set_userdata(array('lang_code' => $lang));
        $_SESSION['lang_code'] = $lang;
        redirect($_SERVER['HTTP_REFERER']);
    }

}
