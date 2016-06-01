<?php

/**
 *
 * @author 	    Brayan Acebo
 * @subpackage 	Sobre Nosotros
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class About_us extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $models = array(
            'about_us_model'
        );
        $this->load->model($models);

        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
        Asset::add_path('contact_us', 'addons/shared_addons/modules/contact_us/');

        $this->template
                ->append_js('contact_us::jquery_validate.js')
                ->append_js('contact_us::formvalidate.js');
    }

    // ------------------------------------------------------------------------

    function index() {
        $data = $this->about_us_model->where('lang', $this->lang_code)->get_all();

        $post = array();

        if (count($data) > 0) {
            $post = $data[0];
        }

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => site_url($post->image),
            'video' => htmlspecialchars_decode($post->video)
        );

        $data_end = array_merge((array) $post, $setter);

        $this->template
                ->title($this->module_details['name'])
                ->set_breadcrumb('Sobre Nosotros')
                ->set('data', (object) $data_end)
                ->build('index');
    }

}

?>