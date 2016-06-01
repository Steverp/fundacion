<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author 		Rigo B Castro
 * @website		http://imaginamos.com
 * @package             PyroCMS
 * @subpackage          In Events Module
 */
class Chat_m extends MY_Model {

    public function __construct() {
        parent::__construct();

        $this->_table = 'chat';

        date_default_timezone_set('America/Bogota');
    }

    public function get_by_current_day() {


        $today = new DateTime();

        $where = array(
            'day' => $today->format('D'),
            'start_hour <=' => $today->format('H:i'),
            'end_hour >=' => $today->format('H:i'),
        );

        $result = $this->get_many_by($where);
        


        return $result;
    }

    // ----------------------------------------------------------------------
}
