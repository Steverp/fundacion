<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @author  Brayan Acebo
 */
class proces_Model extends MY_Model {

    public function __construct()
    {
        parent::__construct();
    }

    public function build_categories($rows,$module=null,$parent=0,$ban=true,$current=null, $lang_admin = 'es')
	{
		$classCategories = 'cat_1';
		$classSubcategoriesFather = 'sortable ui-sortable';
		$classSubcategories = 'subcategori';
		$classActive = 'Activo';
		
        $result = "<ul class='sortable ui-sortable'>";
        foreach ($rows as $row)
		{
            if ($row->parent == $parent)
			{
				foreach ($rows as $subrow)
				{
                    if ($subrow->parent == $row->id)
                     $children = true;
                 else $children = false;
				}
                $result.= "<li id='".$row->id."' class='".($row->parent == 0 ? $classCategories : ($children ? $classSubcategoriesFather : $classSubcategories)).' '.($row->title == $current ? $classActive : '')."'><a href='admin/{$module}/edit_category/". $row->id."/".$lang_admin."' class='edit_categories_ajax'>".$row->title."</a>";
             if ($children = true)
                $result.= $this->build_categories($rows,$module,$row->id,false, $current) . "</li>";
			}
		}
		$result .= "</ul>";
		return $result;
    }

}