<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Contact_Us_Emails_m extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'contact_us_emails';
    }

}