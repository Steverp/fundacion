<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Google_Map_Model extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'google_maps';
    }

    function sqlFormSelect($DB_tabla, $BD_codCampo, $BD_campo, $none, $lang_admin = 'es') {
        $ninguno = array('' => '');

        $datosSql = $this->db->where('lang', $lang_admin)->get($DB_tabla);
        if ($datosSql->num_rows() > 0) {
            $datosArray = array();
            foreach ($datosSql->result_array() as $row) {
                $datosArray[$row[$BD_codCampo]] = $row[$BD_campo];
            }
            if ($none) {
                $datosArray = $ninguno + $datosArray;
            }

            return $datosArray;
        } else {
            return array();
        }
    }

}
