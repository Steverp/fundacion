<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	projects
 * @category 	Modulos
 */
class projects extends Public_Controller {

    private $uri;
    private $uri_detail;

    public function __construct() {
        parent::__construct();
        $this->template
                ->append_js('module::scrollpagination.js')
                ->append_js('module::js_scroll.js');

        $this->inicial_num_pages = 9;
        $this->numer_per_pages = 3;

        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
        if ($this->lang_code == 'es') {
            $this->uri = 'proyectos';
            $this->uri_detail = 'detalle';
        } else {
            $this->uri = 'solutions';
            $this->uri_detail = 'detail';
        }

    }

    public function index() {
        // traemos los datos
        $projects = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->get('projects')
                ->result();

        if (!empty($projects)) {
            foreach ($projects AS $item) {
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        // Consultamos las categorias
        $categories = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->get('project_categories')
                ->result();

        // Intro
        $intro = $this->db->where('lang', $this->lang_code)->get('projects_intro')->row();

        // Devuelve arbol en HTML, el segundo parametro es el nombre del modulo

        $this->template
                ->set('projects', $projects)
                ->set('categories', $categories)
                ->set('intro', $intro)
                ->title('Proyectos')
                ->build('index');
    }

    public function detail($slug) {
        $return = $this->db->where('slug', $slug)->get('projects')->row();

        if (!$return)
            redirect($this->uri);

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => val_image($return->image)
        );

        $project = array_merge((array) $return, $setter);

        $this->template
                ->set('project', (object) $project)
                ->title('Proyectos')
                ->build('detail');
    }

    public function ajax_items($selCategory = null) {
        $page = (isset($_POST['page_ajax']) ? $_POST['page_ajax'] : 1);

        // consulta de los projectos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('projects AS pr')
                ->join('projects_categories AS pm', 'pm.project_id = pr.id', 'left')
                ->join('project_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->limit($this->numer_per_pages, ($page * $this->numer_per_pages) + $this->inicial_num_pages)
                ->order_by('pr.id', 'DESC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // traemos los datos
        $projects = $this->db->get()->result();

        if (!empty($projects)) {
            foreach ($projects AS $item) {
                $item->name = substr($item->name, 0, 20);
                $item->image = val_image($item->image);
                $item->introduction = substr($item->introduction, 0, 100);
                $item->price = ($item->price) ? "Precio: $" . number_format($item->price) : null;
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        $dataView['projects'] = $projects;
        $this->template->set_layout(FALSE);
        $this->template->build('items_ajax', $dataView);
    }

}
