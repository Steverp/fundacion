<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * The User model.
 *
 * @author William Daza
 */
class modules_m extends MY_Model {

    public function __construct() {
        parent::__construct();

        $this->profile_table = $this->db->dbprefix('modules');
    }

    public function get($title) {
        $slug = str_replace('-', '_', slug($title));
        $name = $this->db->where('slug', $slug)->get('modules')->row();
        $n = unserialize($name->name);
        return $n['es'];
    }

}
