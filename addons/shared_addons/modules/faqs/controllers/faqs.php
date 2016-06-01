<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	faqs
 * @category 	Modulos
 */
class faqs extends Public_Controller {

    private $uri;

    public function __construct() {
        parent::__construct();

        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
        if ($this->lang_code == 'es') {
            $this->uri = 'preguntas-frecuentes';
        } else {
            $this->uri = 'FAQ';
        }
    }

    public function index($selCategory = null) {


        $categories = $this->db->query('SELECT * FROM `default_faq_categories` WHERE parent = 0 AND lang = "' . $this->lang_code . '"')->result();
        $active = true;
        $i = 0;
        foreach ($categories as $item) {
            $item->preguntas = $this->db->query('SELECT dbl.slug as slug_p, dbl.name as nombre, dbl.description, dlc.* FROM default_faqs dbl INNER JOIN default_faqs_categories dblc ON dbl.id = dblc.faq_id INNER JOIN default_faq_categories dlc ON dlc.id = dblc.category_id WHERE dlc.id = "' . $item->id . '" AND dbl.lang = "' . $this->lang_code . '"')->result();
            if ($i >= 0 && $active != false) {
                $active = false;
                $item->active = 'in active';
            }
            $i++;
        }
//        echo '<pre>';var_dump($categories);die;
        // Intro
        $intro = $this->db->where('lang', $this->lang_code)->get('faqs_intro')->result();
        $intro = $intro[0];

        // Devuelve arbol en HTML, el segundo parametro es el nombre del modulo

        $this->template
                ->set('categories', $categories)
                ->set('intro', $intro)
                ->build('index');
    }

}
