<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Theme_Picasso extends Theme
{


  public $name			= 'Picasso';
  public $version		= '0.0.1';
  public $author		= 'Diego Velásquez';
  public $author_website	= 'http://diegovelasquez.co/';
  public $description	= 'Theme for Shake-sites ';
  public $website		= 'http://imaginamos.com/';
  public $options 		= array(
		
		
			'framework' 	=> array(
			'title'         => 'Framework',
			'description'   => 'Cambia el framework css',
			'default'       => 'Picasso',
			'type'          => 'select',
			'options'       => 'frameworks/materialize = Materialize CSS | frameworks/bootstrap = Boostrap 3 | framework/foundation = Foundation 5',
			'is_required'   => TRUE
			
		),
		
					'jquery' 	=> array(
			'title'         => 'Versión Jquery',
			'description'   => 'Cambia el la versión de Jquery',
			'default'       => 'Picasso',
			'type'          => 'select',
			'options'       => 'libs/jquery/jquery-1.11.0 = 1.11.0 | libs/jquery/jquery-1.9.1 = 1.9.1',
			'is_required'   => TRUE
			
		),
		
					'theme' 	=> array(
			'title'         => 'Tema',
			'description'   => 'Cambia el tema predeterminado',
			'default'       => 'Picasso',
			'type'          => 'select',
			'options'       => 'themes/default = Default | themes/custom = Custom',
			'is_required'   => TRUE
			
		),
		
			'tipo' 	=> array(
			'title'         => 'Tipografía',
			'description'   => 'Cambia la tipografía del sitio',
			'default'       => 'Picasso',
			'type'          => 'select',
			'options'       => 'variations/style1/default = Default | style1/tipo = Estilo 1 | style2/tipo = Estilo 2 | style3/tipo = Estilo 3',
			'is_required'   => TRUE
			
		),
	
		
			'show_acordeon' 	=> array(
			'title'         => 'Habilitar destacados en acordeón',
			'description'   => 'Si selecciones si, se mostraran los destacados como un acordeon.',
			'default'       => 'no',
			'type'          => 'radio',
			'options'       => 'yes=Yes|no=No',
			'is_required'   => FALSE
			
		),
		
					'showmenu_footer' 	=> array(
			'title'         => 'Habilita el menú del footer',
			'description'   => 'Si selecciones si, se mostraran la navegación en el footer.',
			'default'       => 'no',
			'type'          => 'radio',
			'options'       => 'yes=Yes|no=No',
			'is_required'   => FALSE
			
		),
		

		
  
			'aboutus' 	=> array(
			'title'         => 'Quienes Somos',
			'description'   => 'Cambia el layout de Quienes Somos',
			'default'       => 'Picasso',
			'type'          => 'select',
			'options'       => 'variations/style1/default = Default | variations/style1/aboutus = Estilo 1 | variations/style2/aboutus = Estilo 2 | variations/style3/aboutus = Estilo 3',
			'is_required'   => TRUE
			
		),
		
		
					'show_modernlayout' 	=> array(
			'title'         => 'Habilitar destacados en acordeón',
			'description'   => 'Si selecciones si, se mostraran los destacados como un acordeon.',
			'default'       => 'no',
			'type'          => 'radio',
			'options'       => 'yes=Yes|no=No',
			'is_required'   => FALSE
			
		)
		
		
		

		

		
		
	);
 
}


