<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Brayan Acebo
 */
class Prensa extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $models = array(
            'prensa_intro_m',
            'prensa_m'
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index() {

        // Paginación
        $pagination = create_pagination('prensa/index', $this->prensa_m->count_all(), 15, 3);

        $prensa = $this->prensa_m
                ->limit($pagination['limit'], $pagination['offset'])
                ->order_by('id', 'DESC')
                ->get_all();

        // Intro
        $in = $this->prensa_intro_m->get_all();
        $intro = array();

        if (count($in) > 0) {
            $intro = $in[0];
        }

        $this->template
                ->set('pagination', $pagination)
                ->set('prensa', $prensa)
                ->set('intro', $intro)
                ->build('prensa_front');
    }
}