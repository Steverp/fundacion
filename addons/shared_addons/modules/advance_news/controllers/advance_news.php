<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 *
 * @author 	    Brayan Acebo
 * @author      Luis Fernando Salazar Buitrago
 * @package 	PyroCMS
 * @subpackage 	advance_news
 * @category 	Modulos
 * @license 	Apache License v2.0
 */

class advance_news extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model(array('advance_news_m', 'advance_news_comments_m'));
		// idioma
		$this->lang_code = $this->session->userdata('lang_code');
		if(empty($this->lang_code))
		{
			$this->session->set_userdata(array('lang_code' => 'es'));
			$this->lang_code = $this->session->userdata('lang_code');
		}
    }

    // -----------------------------------------------------------------

    public function index($page = null)
    {
    	$count_all = $this->db->select('COUNT(*) AS numreg')
					->from('advance_news')
					->where('lang', $this->lang_code)
					->get()->row()->numreg;
        $pagination = create_pagination('advance_news/index', $count_all, 10, 3);
		
		$advance_news = $this->db->select('nw.*, COUNT(nc.id) AS comments')
			->from('advance_news AS nw')
			->join('advance_news_comments AS nc', 'nc.id_advance_new = nw.id', 'left')
			->limit($pagination['limit'], $pagination['offset'])
			->group_by("nw.id")
			->order_by('nw.position', 'ASC')
			->where('nw.lang', $this->lang_code)
			->get()
			->result();
		
        foreach($advance_news AS $item)
        {
            $item->title = substr($item->title, 0, 50);
            $item->introduction = substr($item->introduction, 0,800);
            $item->date = fecha_spanish_full($item->date);
            $item->urlDetail = site_url('advance_news/detail/'.$item->slug);
			$item->images = $this->db->where('path IS NOT NULL', null, false)->where('advance_new_id', $item->id)->get('advance_news_images')->result();
        }
		
        $this->template
        ->set('advance_news', $advance_news)
        ->set('pagination', $pagination['links'])
        ->build('index');
    }

    // ----------------------------------------------------------------------

    public function detail($slug)
    {

        $data = $this->advance_news_m->get_many_by('slug', $slug);

        if(!$data)
            redirect('advance_news');

        $post = array();

        if (count($data) > 0) {
            $post = $data[0];
        }
        // Se convierten algunas variables necesarias para usar como slugs
        $setter = array(
            'image' => val_image($post->image),
            'date' => fecha_spanish_full($post->date)
            );

        $data_end = array_merge((array)$post,$setter);
		
		// comentarios
		$advance_news_comments = $this->advance_news_comments_m
		->where('id_advance_new', $data_end['id'])
        ->order_by('id','DESC')
        ->get_all();
		
		// ultimos post
		$last_advance_news = $this->advance_news_m
        ->limit(3)
        ->order_by('position','DESC')
		->where('lang', $this->lang_code)
        ->get_all();
		
		$last_comments = $this->advance_news_comments_m
		->limit(3)
        ->order_by('id','DESC')
        ->get_all();
		
		if(!empty($last_comments))
		{
			foreach($last_comments AS $item)
			{
				$item->comment = substr($item->comment, 0, 50);
			}
		}
		
		$images = $this->db->where('path IS NOT NULL', null, false)->where('advance_new_id', $data_end['id'])->get('advance_news_images')->result();
		
        $this->template
        ->title($this->module_details['name'])
        ->set('data', (object) $data_end)
		->set('advance_news_comments', $advance_news_comments)
		->set('images', $images)
		->set('last_advance_news', $last_advance_news)
		->set('last_comments', $last_comments)
        ->build('detail');

    }
	
	public function insert_comment($id_advance_new = 0, $slug = '')
	{
		$this->form_validation->set_rules('name', 'Nombre', 'required|max_length[100]|trim');
		$this->form_validation->set_rules('email', 'Correo', 'required|max_length[100]|trim|valid_email');
		$this->form_validation->set_rules('comment', 'Mensaje', 'required|trim');
		
		if($this->form_validation->run()!==TRUE)  // abrimos el formulario de edicion
		{
			if(validation_errors() == "")
			{
				$this->session->set_flashdata('error', validation_errors());
			}
		}
		else // si el formulario ha sido enviado con éxito se procede
		{
			unset($_POST['btnAction']);
			unset($_POST['submit']);
            $data = $_POST;
			$data['id_advance_new'] = $id_advance_new;

            if ($this->advance_news_comments_m->insert($data))
            {
                $this->session->set_flashdata('success', 'Comentario creado con éxito.');
            }
            else
            {
                $this->session->set_flashdata('success', 'Error al crear el comentario');
            }
		}
		redirect('advance_news/detail/'.$slug);
	}
}