<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
 
class Widget_Menu_Categories_Product extends Widgets
{
    // The widget title,  this is displayed in the admin interface
    public $title = array(
        'en' => 'Menu de categorias (Widget)',
        'es' => 'Categories Menu (Widget)'
    );
    public $description = array(
        'en' => 'Categories Menu',
        'es' => 'Menu de categorias.'
    );
 
    // The author's name
    public $author = 'Luis Fernando Salazar Buitrago';
 
    // The authors website for the widget
    public $website = 'www.imaginamos.com';
 
    //current version of your widget
    public $version = '1.0';
	
	
    public function run($options)
    {
    	$data = $this->db->order_by('position', 'ASC')->get($this->db->dbprefix.'product_categories')->result();
		
		foreach($data AS $item)
		{
			$item->link = "products/index/".$item->slug;
		}
		
    	return array('categories' => $data, 'current' => null);
    }
}