<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/*
  | -------------------------------------------------------------------------
  | URI ROUTING
  | -------------------------------------------------------------------------
  | This file lets you re-map URI requests to specific controller functions.
  |
  | Typically there is a one-to-one relationship between a URL string
  | and its corresponding controller class/method. The segments in a
  | URL normally follow this pattern:
  |
  |	example.com/class/method/id/
  |
  | In some instances, however, you may want to remap this relationship
  | so that a different class/function is called than the one
  | corresponding to the URL.
  |
  | Please see the user guide for complete details:
  |
  |	http://codeigniter.com/user_guide/general/routing.html
  |
  | -------------------------------------------------------------------------
  | RESERVED ROUTES
  | -------------------------------------------------------------------------
  |
  | There are two reserved routes:
  |
  |	$route['default_controller'] = 'welcome';
  |
  | This route indicates which controller class should be loaded if the
  | URI contains no data. In the above example, the "welcome" class
  | would be loaded.
  |
  |	$route['404_override'] = 'errors/page_missing';
  |
  | This route will tell the Router what URI segments to use if those provided
  | in the URL cannot be matched to a valid route.
  |
 */

$route['default_controller'] = 'home';
$route['404_override'] = 'pages';

$route['admin/help/([a-zA-Z0-9_-]+)'] = 'admin/help/$1';
$route['admin/([a-zA-Z0-9_-]+)/(:any)'] = '$1/admin/$2';
$route['admin/(login|logout|remove_installer_directory)'] = 'admin/$1';
$route['admin/([a-zA-Z0-9_-]+)'] = '$1/admin/index';

$route['api/ajax/(:any)'] = 'api/ajax/$1';
$route['api/([a-zA-Z0-9_-]+)/(:any)'] = '$1/api/$2';
$route['api/([a-zA-Z0-9_-]+)'] = '$1/api/index';

$route['register'] = 'users/register';
$route['user/(:any)'] = 'users/view/$1';
$route['my-profile'] = 'users/index';
$route['edit-profile'] = 'users/edit';

$route['sitemap.xml'] = 'sitemap/xml';
$route['nosotros'] = 'about_us_multiples';
$route['about-us'] = 'about_us_multiples';
$route['contactenos'] = 'contact_us';
$route['galeria'] = 'gallery';

$route['preguntas-frecuentes'] = 'faqs';
$route['FAQ'] = 'faqs';

$route['novedades'] = 'news';
$route['novedades/detalle/([a-zA-Z0-9_-]+)'] = 'news/detail/$1';

$route['productos'] = 'products';
$route['productos/detalle/([a-zA-Z0-9_-]+)'] = 'products/detail/$1';
$route['productos/index/([a-zA-Z0-9_-]+)'] = 'products/index/$1';

$route['proyectos'] = 'projects';
$route['proyectos/detalle/([a-zA-Z0-9_-]+)'] = 'projects/detail/$1';
$route['proyectos/index/([a-zA-Z0-9_-]+)'] = 'projects/index/$1';

$route['galerias'] = 'gallerys';
$route['galerias/detalle/([a-zA-Z0-9_-]+)'] = 'gallerys/detail/$1';
$route['galerias/index/([a-zA-Z0-9_-]+)'] = 'gallerys/index/$1';
$route['galerias/index'] = 'gallerys/index';

$route['procesos'] = 'process';
$route['procesos/detalle/([a-zA-Z0-9_-]+)'] = 'process/detail/$1';
$route['procesos/userdocs/([a-zA-Z0-9_-]+)'] = 'process/userdocs/$1';
$route['procesos/proceso/([a-zA-Z0-9_-]+)'] = 'process/proces/$1';
$route['procesos/index/([a-zA-Z0-9_-]+)'] = 'process/index/$1';

$route['servicios'] = 'services';
$route['servicios/detalle/([a-zA-Z0-9_-]+)'] = 'services/detail/$1';
$route['servicios/index/([a-zA-Z0-9_-]+)'] = 'services/index/$1';

/* End of file routes.php */