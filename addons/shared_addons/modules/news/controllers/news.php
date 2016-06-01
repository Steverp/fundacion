<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @author      Luis Fernando Salazar Buitrago
 * @package 	PyroCMS
 * @subpackage 	news
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class news extends Public_Controller {

    private $uri;
    private $uri_detail;

    public function __construct() {
        parent::__construct();
        $this->load->model(array('news_m', 'news_comments_m'));
        // idioma
        $this->lang_code = $this->session->userdata('lang_code');
        if (empty($this->lang_code)) {
            $this->session->set_userdata(array('lang_code' => 'es'));
            $this->lang_code = $this->session->userdata('lang_code');
        }
        if ($this->lang_code == 'es') {
            $this->uri = 'novedades';
            $this->uri_detail = 'detalle';
        } else {
            $this->uri = 'news';
            $this->uri_detail = 'detail';
        }
        
        Asset::add_path('contact_us', 'addons/shared_addons/modules/contact_us/');

        $this->template
                ->append_js('contact_us::jquery_validate.js')
                ->append_js('contact_us::formvalidate.js');
    }

    // -----------------------------------------------------------------

    public function index($page = null) {
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('news')
                        ->where('lang', $this->lang_code)
                        ->get()->row()->numreg;
        $pagination = create_pagination($this->uri . '/index', $count_all, 6, 3);

        $news = $this->db->select('nw.*, COUNT(nc.id) AS comments')
                ->from('news AS nw')
                ->join('news_comments AS nc', 'nc.id_new = nw.id', 'left')
                ->limit($pagination['limit'], $pagination['offset'])
                ->group_by("nw.id")
                ->order_by('nw.position', 'ASC')
                ->where('nw.lang', $this->lang_code)
                ->get()
                ->result();

        foreach ($news AS $item) {
            $item->title = substr($item->title, 0, 50);
            $item->image = val_image($item->image);
            $item->introduction = substr($item->introduction, 0, 800);
            $item->date = fecha_spanish_full($item->date);
            $item->urlDetail = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
        }

        $this->template
                ->set('news', $news)
								->title('Actualidad')
                ->set('pagination', $pagination['links'])
                ->build('index');
    }

    // ----------------------------------------------------------------------

    public function detail($slug) {

        $data = $this->news_m->get_many_by('slug', $slug);

        if (!$data)
            redirect('news');

        $post = array();

        if (count($data) > 0) {
            $post = $data[0];
        }
        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => val_image($post->image),
            'date' => fecha_spanish_full($post->date)
        );

        $data_end = array_merge((array) $post, $setter);

        // comentarios
        $news_comments = $this->news_comments_m
                ->where('id_new', $data_end['id'])
                ->order_by('id', 'DESC')
                ->get_all();

        // ultimos post
        $last_news = $this->news_m
                ->limit(3)
                ->order_by('position', 'DESC')
                ->where('lang', $this->lang_code)
                ->get_all();

        $last_comments = $this->news_comments_m
                ->limit(3)
                ->order_by('id', 'DESC')
                ->get_all();

        if (!empty($last_comments)) {
            foreach ($last_comments AS $item) {
                $item->comment = substr($item->comment, 0, 50);
            }
        }

        $this->template
                ->title($this->module_details['name'])
                ->set('data', (object) $data_end)
                ->set('news_comments', $news_comments)
                ->set('last_news', $last_news)
                ->set('last_comments', $last_comments)
                ->build('detail');
    }

    public function insert_comment($id_new = 0, $slug = '') {
        $this->form_validation->set_rules('name', 'Nombre', 'required|max_length[100]|trim');
        $this->form_validation->set_rules('email', 'Correo', 'required|max_length[100]|trim|valid_email');
        $this->form_validation->set_rules('comment', 'Mensaje', 'required|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            if (validation_errors() == "") {
                $this->session->set_flashdata('error', validation_errors());
            }
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']);
            unset($_POST['submit']);
            $data = $_POST;
            $data['id_new'] = $id_new;

            if ($this->news_comments_m->insert($data)) {
                $this->session->set_flashdata('success', 'Comentario creado con éxito.');
            } else {
                $this->session->set_flashdata('success', 'Error al crear el comentario');
            }
        }
        redirect($this->uri . '/' . $this->uri_detail . '/' . $slug);
    }

}
