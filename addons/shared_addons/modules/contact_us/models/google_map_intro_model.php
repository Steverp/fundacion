<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Google_Map_Intro_Model extends MY_Model {

    public function __construct()
    {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'google_maps_intro';
    }

}