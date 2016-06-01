<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class Contact_Us_m extends MY_Model {

    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'contact_us';
    }
	
	function sqlFormSelectQuery($datosSql, $BD_codCampo, $BD_campo, $blanco = null)
	{
		$datosArray = array();
		if($blanco != null)
		{
			$datosArray = array('' => '');
		}
		if($datosSql != '')
		{
			if($datosSql->num_rows() > 0)
			{
				foreach ($datosSql->result_array() as $row)
				{
					$datosArray[$row[$BD_codCampo]] = $row[$BD_campo];
				}
				return $datosArray;
			}
			else
			{
				return array();
			}
		}
		else
		{
			return array();
		}
		
	}
	
	function sqlFormSelect($DB_tabla, $BD_codCampo, $BD_campo, $none, $nom_where = null, $value_where = null, $lang_code = 'es')
	{
		$ninguno = array('' => '');
		if($nom_where != null && $value_where != null)
		{
			$this->db->where($nom_where, $value_where);
		}
		if(!empty($lang_code))
		{
			$this->db->where('lang', $lang_code);
		}
		$datosSql = $this->db->get($DB_tabla);
		if($datosSql->num_rows() > 0)
		{
			$datosArray = array();
			foreach ($datosSql->result_array() as $row)
			{
				$datosArray[$row[$BD_codCampo]] = $row[$BD_campo];
			}
			if($none)
			{
				$datosArray = $ninguno + $datosArray;
			}
			
			return $datosArray;
		}
		else
		{
			return array();
		}
	}
}