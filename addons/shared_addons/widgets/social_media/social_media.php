<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Widget_Social_Media extends Widgets {

    // The widget title,  this is displayed in the admin interface
    public $title = array(
        'en' => 'Social Media',
        'es' => 'Datos de contacto en el footer (Widget)'
    );
    public $description = array(
        'en' => '',
        'es' => 'Redes sociales.'
    );
    // The author's name
    public $author = 'Carolina Rodriguez';
    // The authors website for the widget
    public $website = 'www.imaginamos.com';
    //current version of your widget
    public $version = '1.0';

    public function run() {
        $data = $this->db->select('*')
                        ->from('contact_us AS cu')->get()->result_array();

        return array('data' => $data[0]);
    }

}
