<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Luis Fernando Salazar
 * @package 	PyroCMS
 * @subpackage 	multi_upload_files
 * @category 	Modulos
 */
class Multi_Upload_Files extends Public_Controller {

    var $moduleName = 'multi_upload_files';
    private $uri;

    public function __construct() {
        parent::__construct();
        $models = array(
            "multi_upload_file_model",
            "multi_upload_file_category_model",
            "multi_upload_file_intro_model"
        );
        if ($this->lang_code == 'es') {
            $this->uri = 'multi_upload_files';
        } else {
            $this->uri = 'multi_upload_files';
        }
        $this->load->model($models);
    }

// -----------------------------------------------------------------

    public function index($selCategory = null) {
        $category = null;
        $search = '';
        $sql = ' SELECT dmu.* FROM default_multi_upload_files dmu INNER JOIN default_multi_upload_file_categories dmuc ON dmu.category = dmuc.id';
//        $this->db->query($sql);
        $this->db->from('multi_upload_files dmu')
                ->join('multi_upload_file_categories dmuc', 'dmu.category = dmuc.id', 'inner');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('dmuc.slug', $selCategory);
        }
        $multi_upload_files = $this->db->get()->result();
        $fracciones = null;
//        echo '<pre>';
        foreach ($multi_upload_files as $item) {
            $fracciones = explode('.', $item->image);
            $name = explode('/', $fracciones[0]);
            $item->name = $name[4];
//            gif|jpg|jpeg|png
            if ($item->extencion == '.jpg' || $item->extencion == '.jpeg' || $item->extencion == '.gif' || $item->extencion == '.png') {
                $item->image_ext = $item->image;
            } else if ($item->extencion == '.doc' || $item->extencion == '.docx') {
                $item->doc = $item->image;
                $item->img_doc = 'fa fa-file-word-o';
            } else if ($item->extencion == '.txt') {
                $item->doc = $item->image;
                $item->img_doc = 'fa fa-file-text-o';
            } else if ($item->extencion == '.pdf') {
                $item->doc = $item->image;
                $item->img_doc = 'fa fa-file-pdf-o';
            } else if ($item->extencion == '.xls' || $item->extencion == '.xlsx') {
                $item->doc = $item->image;
                $item->img_doc = 'fa fa-file-excel-o';
            } else {
                $item->img_doc = 'fa fa-file';
            }
        }
//        echo '<pre>';var_dump($multi_upload_files);die;
        // Consultamos las categorias
        $categories = $this->multi_upload_file_category_model
                ->order_by('position', 'ASC')
                ->get_all();

        // Intro
        $in = $this->multi_upload_file_intro_model->get_all();
        $intro = array();
        if (count($in) > 0) {
            $intro = $in[0];
        }

        $this->template
                ->append_css('module::photobox.css')
                ->append_js('module::admin/photobox.min.js')
                ->set('archivosAdjuntos', $multi_upload_files)
                ->set('category', $category)
                ->set('categories', $categories)
                ->set('current', ($category) ? $category->title : null)
                ->set('moduleName', $this->moduleName)
                ->set('intro', $intro)
                ->set('search', $search)
                ->set('selCategory', $selCategory)
                ->set('uri', $this->uri)
                ->build('index');
    }

}
