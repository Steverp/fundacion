<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @author      Luis Fernando Salazar Buitrago
 * @package 	PyroCMS
 * @subpackage 	about_us_multiples
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class about_us_multiples extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $models = array('about_us_multiples_m', 'work_team_m');
        $this->load->model($models);
        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
    }

    // -----------------------------------------------------------------

    public function index() {
        $work_team = $this->db->get('work_team')->result();
        
        $customers = $this->db->get('about_us_slide')->result();
        $partners = $this->db->get('about_us_partners')->result();

        $intro = $this->db->get('about_us_intro')->row();

        $this->template
                ->title('Nosotros')
                ->set('work_team', $work_team)
                ->set('customers', $customers)
                ->set('partners', $partners)
                ->set('intro', $intro)
                ->build('index');
    }

}
