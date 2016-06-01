<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Ask_Mail extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'ask_mail';
    }

}