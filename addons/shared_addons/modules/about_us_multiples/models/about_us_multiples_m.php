<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class about_us_multiples_m extends MY_Model {

    public function __construct()
    {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'about_us_multiples';
    }

}