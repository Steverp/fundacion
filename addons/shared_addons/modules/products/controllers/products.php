<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	Products
 * @category 	Modulos
 */
class Products extends Public_Controller {

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
            $this->uri = 'productos';
            $this->uri_detail = 'detalle';
        } else {
            $this->uri = 'products';
            $this->uri_detail = 'detail';
        }
        
        Asset::add_path('contact_us', 'addons/shared_addons/modules/contact_us/');

        $this->template
                ->append_js('contact_us::jquery_validate.js')
                ->append_js('contact_us::formvalidate.js');
    }

    public function index($selCategory = null) {
        // se inicializan variables
        $category = null;
        $search = '';

        // consulta de los productos a sus respectivas tablas
        $this->db->select('pr.*, pc.title')
                ->from('products AS pr')
                ->join('products_categories AS pm', 'pm.product_id = pr.id', 'left')
                ->join('product_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->group_by('pr.id')
                ->order_by('pc.position ,pr.position', 'ASC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los productos
            $search = $_POST['shearch'];
            $search = explode(' ', $search);
            if (!empty($search) && count($search) > 1) {
                $first = FALSE;
                foreach ($search AS $item) {
                    if ($first) {
                        $this->db->like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                        $this->db->or_like('pc.title', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pc.title),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                        $first = TRUE;
                    } else {
                        $this->db->or_like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                        $this->db->or_like('pc.title', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pc.title),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                    }
                }
            } else {
                $this->db->like('pr.name', $_POST['shearch']);
                $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $_POST['shearch']);
                $this->db->or_like('pc.title', $_POST['shearch']);
                $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pc.title),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $_POST['shearch']);
            }
        }

        // traemos los datos
        $products = $this->db->get()->result();


        if (!empty($products)) {
            foreach ($products AS $item) {
                if (empty($item->image)) {
                    $image_excel = $this->db->where('id', $item->image_excel)->get('files')->row()->filename;
                }
                $item->name = substr($item->name, 0, 40);
                $item->image = (!empty($item->image) ? val_image($item->image) : 'uploads/default/files/' . $image_excel);
                $item->introduction = substr($item->introduction, 0, 100);
                $item->price = ($item->price) ? "Precio: $" . number_format($item->price) : null;
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        // Consultamos las categorias
        $categories = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $this->lang_code)
                ->get('product_categories')
                ->result();

        // Intro
        $intro = $this->db->where('lang', $this->lang_code)->get('products_intro')->result();
        $intro = $intro[0];
        

        // Devuelve arbol en HTML, el segundo parametro es el nombre del modulo
       
        $this->template
                ->set('products', $products)
                ->set('category', ($category) ? "/ " . $category->title : null)
                ->set('categories', $categories)
                ->set('current', ($category) ? $category->title : null)
                ->set('intro', $intro)
                ->set('search', $search)
                ->set('selCategory', $selCategory)
                ->set('uri', $this->uri)
                ->build('index');
    }

    public function detail($slug) {
        $return = $this->db->where('slug', $slug)->get('products')->row();

        if (!$return)
            redirect($this->uri);
        if (empty($return->image)) {
            $image_excel = $this->db->where('id', $return->image_excel)->get('files')->row()->filename;
        }

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => (!empty($return->image) ? val_image($return->image) : 'uploads/default/files/' . $image_excel),
            'price' => ($return->price) ? "Precio: $" . number_format($return->price) : null
        );

        $product = array_merge((array) $return, $setter);

        $relation = $this->db->where('product_id', $product['id'])->get('products_categories')->result();
        $categories = array();
        foreach ($relation as $item) {
            $category = $this->db->where('lang', $this->lang_code)->where('id', $item->category_id)->get('product_categories')->row();
            if (!empty($category)) {
                $categories[] = array(
                    "title" => $category->title,
                    "slug" => $category->slug
                );
            }
        }

        // imagenes para slider
        $images = $this->db->where('path IS NOT NULL', null, false)->where('product_id', $product['id'])->get('product_images')->result();
        $feat = $this->db->where('kind', 1)->get('features')->result();
        $ben = $this->db->where('kind', 2)->get('features')->result();


        $this->template
                ->set('product', (object) $product)
                ->set('categories', $categories)
                ->set('feat', $feat)
                ->set('ben', $ben)
                ->set('images', $images)
                ->set('videos', $videos)
                ->build('detail');
    }

    public function ajax_items($selCategory = null) {
        $page = (isset($_POST['page_ajax']) ? $_POST['page_ajax'] : 1);

        // consulta de los productos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('products AS pr')
                ->join('products_categories AS pm', 'pm.product_id = pr.id', 'left')
                ->join('product_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->limit($this->numer_per_pages, ($page * $this->numer_per_pages) + $this->inicial_num_pages)
                ->order_by('pr.id', 'DESC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // traemos los datos
        $products = $this->db->get()->result();

        if (!empty($products)) {
            foreach ($products AS $item) {
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

        $dataView['products'] = $products;
        $this->template->set_layout(FALSE);
        $this->template->build('items_ajax', $dataView);
    }

    public function add_product_contact($id_product) {

        $info_products = $this->db->where('id', $id_product)->get('products')->row();
        $products_contact = $this->session->userdata('products_contact');
        if (empty($products_contact)) {
            $products_contact = array();
        }

        if (empty($info_products->image)) {
            $image_excel = $this->db->where('id', $info_products->image_excel)->get('files')->row()->filename;
        }

        if (!isset($products_contact[$id_product])) {
            $products_contact[$id_product] = array(
                'id' => $info_products->id,
                'name' => $info_products->name,
                'description' => $info_products->description,
                'image' => (!empty($info_products->image) ? val_image($info_products->image) : 'uploads/default/files/' . $image_excel),
                'pagina' => 'products');
        }

        $this->session->set_userdata(array('products_contact' => $products_contact));

        redirect('contact_us');
    }

    public function destroy_product_contact($id_product) {
        $products_contact = $this->session->userdata('products_contact');
        if (!empty($products_contact)) {
            if (isset($products_contact[$id_product])) {
                unset($products_contact[$id_product]);
                $this->session->set_userdata(array('products_contact' => $products_contact));
                echo json_encode('exito');
            }
        } else {
            echo json_encode('error');
        }
    }

}
