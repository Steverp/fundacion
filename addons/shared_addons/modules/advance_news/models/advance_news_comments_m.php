<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class advance_news_Comments_M extends MY_Model {

    public function __construct()
    {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'advance_news_comments';
    }

}