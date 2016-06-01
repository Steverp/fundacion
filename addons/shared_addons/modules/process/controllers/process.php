<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	process
 * @category 	Modulos
 */
class process extends Public_Controller {

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
            $this->uri = 'procesos';
            $this->uri_detail = 'detalle';
            $this->uri_detail_proc = 'proceso';
        } else {
            $this->uri = 'process';
            $this->uri_detail = 'detail';
        }
    }

    public function index($selCategory = null) {
        // se inicializan variables
        $category = null;
        $search = '';
        $lang = $this->lang_code;

        // consulta de los procesos a sus respectivas tablas
        $this->db->select('pr.*, pc.title')
                ->from('process AS pr')
                ->join('process_categories AS pm', 'pm.proces_id = pr.id', 'left')
                ->join('proces_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $lang)
                ->group_by('pr.id')
                ->order_by('pc.position ,pr.position', 'ASC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los procesos
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
        $process = $this->db->get()->result();

        if (!empty($process)) {
            foreach ($process AS $item) {
                $item->name = substr($item->name, 0, 40);
                $item->image = val_image($item->image);
                $item->introduction = substr($item->introduction, 0, 200);
                $item->price = ($item->price) ? "Precio: $" . number_format($item->price) : null;
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        // Consultamos las categorias
        $categories = $this->db
                ->order_by('position', 'ASC')
                ->where('lang', $lang)
                ->get('proces_categories')
                ->result();

        // Intro
        $intro = $this->db->where('lang', $lang)->get('process_intro')->result();
        $intro = $intro[0];

        // Devuelve arbol en HTML, el segundo parametro es el nombre del modulo

        $this->template
                ->set('process', $process)
                ->set('category', ($category) ? "/ " . $category->title : null)
                ->set('categories', $categories)
                ->set('current', ($category) ? $category->title : null)
                ->set('intro', $intro)
                ->set('search', $search)
                ->set('lang', $lang)
                ->set('selCategory', $selCategory)
                ->set('uri', $this->uri)
                ->build('index');
    }

    public function detail($slug) {
        $return = $this->db->where('slug', $slug)->get('process')->row();

        if (!$return)
            redirect($this->uri);

        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => val_image($return->image),
            'price' => ($return->price) ? "Precio: $" . number_format($return->price) : null
        );

        $proces = array_merge((array) $return, $setter);

        $relation = $this->db->where('proces_id', $proces['id'])->get('process_categories')->result();
        $categories = array();
        foreach ($relation as $item) {
            $category = $this->db->where('lang', $this->lang_code)->where('id', $item->category_id)->get('proces_categories')->row();
            if (!empty($category)) {
                $categories[] = array(
                    "title" => $category->title,
                    "slug" => $category->slug
                );
            }
        }

        // imagenes para slider
        $images = $this->db->where('path IS NOT NULL', null, false)->where('proces_id', $proces['id'])->get('proces_images')->result();
        $videos = $this->db->where('video IS NOT NULL', null, false)->where('proces_id', $proces['id'])->get('proces_images')->result();

        if (!empty($videos)) {
            foreach ($videos AS $item) {
                $img_video = explode("v=", $item->video);

                if (isset($img_video[1])) {
                    $item->img_video = $img_video[1];
                }
            }
        }

        $this->template
                ->set('proces', (object) $proces)
                ->set('categories', $categories)
                ->set('images', $images)
                ->set('videos', $videos)
                ->build('detail');
    }

    public function ajax_items($selCategory = null) {
        $page = (isset($_POST['page_ajax']) ? $_POST['page_ajax'] : 1);

        // consulta de los procesos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('process AS pr')
                ->join('process_categories AS pm', 'pm.proces_id = pr.id', 'left')
                ->join('proces_categories AS pc', 'pc.id = pm.category_id', 'left')
                ->where('pr.lang', $this->lang_code)
                ->limit($this->numer_per_pages, ($page * $this->numer_per_pages) + $this->inicial_num_pages)
                ->order_by('pr.id', 'DESC');

        // si se selecciona una categoria
        if ($selCategory) {
            $this->db->where('pc.slug', $selCategory);
        }

        // traemos los datos
        $process = $this->db->get()->result();

        if (!empty($process)) {
            foreach ($process AS $item) {
                $item->name = substr($item->name, 0, 20);
                $item->image = val_image($item->image);
                $item->introduction = substr($item->introduction, 0, 100);
                $item->price = ($item->price) ? "Precio: $" . number_format($item->price) : null;
                $item->url = site_url($this->uri . '/' . $this->uri_detail . '/' . $item->slug);
            }
        }

        $dataView['process'] = $process;
        $this->template->set_layout(FALSE);
        $this->template->build('items_ajax', $dataView);
    }
    
    public function add_proces_contact($id_proces) {

        $info_process = $this->db->where('id', $id_proces)->get('process')->row();
        $process_contact = $this->session->userdata('process_contact');
        if (empty($process_contact)) {
            $process_contact = array();
        }

        if (!isset($process_contact[$id_proces])) {
            $process_contact[$id_proces] = array(
                'id' => $info_process->id,
                'name' => $info_process->name,
                'description' => $info_process->description,
                'image' => (!empty($info_process->image) ? val_image($info_process->image) : 'uploads/default/files/' . $image_excel),
                'pagina' => 'process');
        }

        $this->session->set_userdata(array('process_contact' => $process_contact));

        redirect('contact_us');
    }

    public function destroy_proces_contact($id_proces) {
        $process_contact = $this->session->userdata('process_contact');
        if (!empty($process_contact)) {
            if (isset($process_contact[$id_proces])) {
                unset($process_contact[$id_proces]);
                $this->session->set_userdata(array('process_contact' => $process_contact));
                echo json_encode('exito');
            }
        } else {
            echo json_encode('error');
        }
    }
    
    public function userdocs($idUser) {
        
        $name = '';
        $cod = '';
        $estado = '';
        
        $return = $this->db
                ->where('id', $idUser)
                ->get('users')
                ->row();

        if (!$return) {
            redirect('home');
        }
        
        $this->db->select('pr.*')
                ->from('user_process AS pr')
                ->order_by('pr.id', 'DESC')
                ->where('pr.id_user', $return->id);
        
        if (!empty($_POST['estado'])) {
            // Se consultan los projectos
            $estado = $_POST['estado'];
            $this->db->where('pr.id_estado', $estado);
        }
        
        // si se esta buscando
        if (isset($_POST['cod'])) {
            // Se consultan los procesos
            $cod = $_POST['cod'];
            $cod = explode(' ', $cod);
            if (!empty($cod) && count($cod) > 1) {
                $first = FALSE;
                foreach ($cod AS $item) {
                    if ($first) {
                        $this->db->like('pr.cod', $item);
                        $first = TRUE;
                    } else {
                        $this->db->or_like('pr.cod', $item);                        
                    }
                }
            } else {
                $this->db->like('pr.cod', $_POST['cod']);
            }
        }
        
        // si se esta buscando
        if (isset($_POST['title'])) {
            // Se consultan los procesos
            $name = $_POST['title'];
            $name = explode(' ', $name);
            if (!empty($name) && count($name) > 1) {
                $first = FALSE;
                foreach ($name AS $itemn) {
                    if ($first) {
                        $this->db->like('pr.title', $itemn);
                        $first = TRUE;
                    } else {
                        $this->db->or_like('pr.title', $itemn);                        
                    }
                }
            } else {
                $this->db->like('pr.title', $_POST['title']);
            }
        }
        
        // traemos los datos
        $process = $this->db->get()->result();

//        $process = $this->db->where('id_user', $return->id)->get('user_process')->result();
        foreach ($process as $pro) {
            $pro->estado = $this->db->select('name')->where('id', $pro->id_estado)->get('process_state')->row();
            $pro->link = site_url($this->uri . '/'. $this->uri_detail_proc .'/' . $pro->cod);
        }
//        
//        echo "<pre>";
//        var_dump($process);die;
        
        $estados = $this->db->get('process_state')->result();

        $this->template
                ->set('user', $return)
                ->set('process', $process)
                ->set('estados', $estados)
                ->build('documents');
    }
    
    public function proces($slug) {
        $return = $this->db->where('cod', $slug)->get('user_process')->row();

        if (!$return)
            redirect('home');

        $process = $return;
        
        $estado = $this->db->where('id', $process->id_estado)->get('process_state')->row();
        $docs =  $this->db->where('id_user_process', $process->id)->get('process_doc')->result();
        
        $this->template
                ->set('process', $process)
                ->set('estado', $estado)
                ->set('docs', $docs)
                ->build('detail_process');
    }
    
}
