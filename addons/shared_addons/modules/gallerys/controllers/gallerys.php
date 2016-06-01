<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	gallerys
 * @category 	Modulos
 */
class gallerys extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $this->template
                ->append_js('module::scrollpagination.js')
                ->append_js('module::js_scroll.js')
                ->append_js('module::jquery-ui.js');

        $this->inicial_num_pages = 9;
        $this->numer_per_pages = 3;

        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
        if ($this->lang_code == 'es') {
            $this->uri = 'galerias';
            $this->uri_detail = 'detalle';
        } else {
            $this->uri = 'gallery';
            $this->uri_detail = 'detail';
        }
    }

    public function index() {
        // traemos los datos
        $gallerys = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->get('gallerys')
                ->result();

        if (!empty($gallerys)) {
            foreach ($gallerys AS $item) {
                $item->name = $item->name;
                $item->image = val_image($item->image);
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
                $item->date = fecha_spanish_full($item->date, false, false);
                $categorias = $this->db->where('gallery_id', $item->id)->get('gallerys_categories')->result();
                foreach ($categorias as $cat) {
                    $item->category = $this->db->where('id', $cat->category_id)->get('gallery_categories')->row()->id;
                }
            }
        }

        // Consultamos las categorias
        $categories = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->get('gallery_categories')
                ->result();

        // Intro
        $intro = $this->db->where('lang', $this->lang_code)->get('gallerys_intro')->row();

        // Devuelve arbol en HTML, el segundo parametro es el nombre del modulo

        $this->template
                ->set('gallerys', $gallerys)
                ->set('categories', $categories)
                ->set('intro', $intro)
                ->set('Galerías')
                ->build('index');
    }

    public function detail($slug) {
        $return = $this->db->where('slug', $slug)->get('gallerys')->row();

        if (!$return)
            redirect('gallerys');

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => val_image($return->image)
        );

        $gallery = array_merge((array) $return, $setter);

        // imagenes para slider
        $images = $this->db->where('path IS NOT NULL', null, false)->where('gallery_id', $gallery['id'])->order_by('position', 'ASC')->get('gallery_images')->result();

        $this->template
                ->set('gallery', (object) $gallery)
                ->set('images', $images)
                ->build('detail');
    }

    public function ajax_items($selCategory = null) {
        $page = (isset($_POST['page_ajax']) ? $_POST['page_ajax'] : 1);

        // consulta de los galleryos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('gallerys AS pr')
                ->join('gallerys_categories AS pm', 'pm.gallery_id = pr.id', 'left')
                ->join('gallery_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->limit($this->numer_per_pages, ($page * $this->numer_per_pages) + $this->inicial_num_pages)
                ->order_by('pr.id', 'DESC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // traemos los datos
        $gallerys = $this->db->get()->result();

        if (!empty($gallerys)) {
            foreach ($gallerys AS $item) {
                $item->name = $item->name;
                $item->image = val_image($item->image);
                $item->url = site_url('gallerys/detail/' . $item->slug);
            }
        }

        $dataView['gallerys'] = $gallerys;
        $this->template->set_layout(FALSE);
        $this->template->build('items_ajax', $dataView);
    }

}
