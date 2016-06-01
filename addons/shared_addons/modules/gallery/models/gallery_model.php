<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Gallery_Model extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'gallery';
    }
	
	public function _is_youtube($url)
	{
	  return (preg_match('/youtu\.be/i', $url) || preg_match('/youtube\.com\/watch/i', $url));
	}
	
	public function _is_vimeo($url)
	{
	  return (preg_match('/vimeo\.com/i', $url));
	}
}