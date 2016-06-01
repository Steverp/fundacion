<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	services
 * @category 	Modulos
 */
class services extends Public_Controller {

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
            $this->uri = 'servicios';
            $this->uri_detail = 'detalle';
        } else {
            $this->uri = 'services';
            $this->uri_detail = 'detail';
        }
        
    }

    public function index() {
        // traemos los datos
        $servicesdest = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->where('outstanding', 1)
                ->get('services')
                ->result();
        
        $services = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->where_not_in('outstanding', 1)
                ->get('services')
                ->result();

        // Intro
        $intro = $this->db->where('lang', $this->lang_code)->get('services_intro')->row();
        
        $this->template
                ->set('servicesdest', $servicesdest)
                ->set('services', $services)
                ->set('intro', $intro)
                ->build('index');
    }

    public function ajax_items($selCategory = null) {
        $page = (isset($_POST['page_ajax']) ? $_POST['page_ajax'] : 1);

        // consulta de los servicios a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('services AS pr')
                ->join('services_categories AS pm', 'pm.service_id = pr.id', 'left')
                ->join('service_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->limit($this->numer_per_pages, ($page * $this->numer_per_pages) + $this->inicial_num_pages)
                ->order_by('pr.id', 'DESC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // traemos los datos
        $services = $this->db->get()->result();

        if (!empty($services)) {
            foreach ($services AS $item) {
                if (empty($item->image)) {
                    $image_excel = $this->db->where('id', $item->image_excel)->get('files')->row()->filename;
                }
                $item->name = substr($item->name, 0, 90);
                $item->image = (!empty($item->image) ? val_image($item->image) : 'uploads/default/files/' . $image_excel);
                $item->introduction = substr($item->introduction, 0, 100);
                $item->price = ($item->price) ? "Precio: $" . number_format($item->price) : null;
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        $dataView['services'] = $services;
        $this->template->set_layout(FALSE);
        $this->template->build('items_ajax', $dataView);
    }

}
