<?php

if (!defined('BASEPATH'))
	exit('No direct script access allowed');

/**
 *
 * @author 	Luis Fernando Salazar Buitrago
 * @author 	Brayan Acebo
 * @package 	PyroCMS
 * @subpackage 	advance_news
 * @category 	Modules
 * @license 	Apache License v2.0
 */

class Admin extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->lang->load('advance_news');
		$this->template
		->append_js('module::developer.js')
		->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
		$this->load->model(array('advance_news_m', 'advance_news_comments_m'));
	}

	public function index($lang_admin = 'es', $pag = 1)
	{
		// advance_news
		$count_all = $this->db->select('COUNT(*) AS numreg')
					->from('advance_news')
					->where('lang', $lang_admin)
					->get()->row()->numreg;
		$pagination = create_pagination('admin/advance_news/index/'.$lang_admin, $count_all, 15, 4);

		$advance_news = $this->advance_news_m
			->limit($pagination['limit'], $pagination['offset'])
			->order_by('position','ASC')
			->where('lang', $lang_admin)
			->get_all();

		$pag = $pagination['offset'];
		
		$comments = $this->db->select('cm.*, nw.title')
					->from('advance_news_comments AS cm')
					->join('advance_news AS nw', 'nw.id = cm.id_advance_new', 'left')
					->where('nw.lang', $lang_admin)
					->order_by('cm.id', 'DESC')->get()->result();
		
		$this->template
		->append_js('module::admin/ajax.js')
		->set('advance_news', $advance_news)
		->set('comments', $comments)
		->set('pagination', $pagination)
		->set('pag', $pag)
		->set('lang_admin', $lang_admin)
		->build('admin/index');
	}

	public function edit_advance_new($idItem = null, $lang_admin = 'es')
	{
		$this->form_validation->set_rules('title_said', 'Texto', 'max_length[100]|trim');
		$this->form_validation->set_rules('autor_said', 'Autor Texto', 'max_length[50]|trim');
		$this->form_validation->set_rules('title', 'Título', 'required|max_length[100]|trim');
		$this->form_validation->set_rules('autor', 'Autor', 'max_length[50]|trim');
		$this->form_validation->set_rules('iframe', 'Iframe', 'trim');
		$this->form_validation->set_rules('content', 'Contenido', 'required|trim');
		$this->form_validation->set_rules('introduction', 'Introducción', 'required|max_length[600]|trim');

		if($this->form_validation->run()!==TRUE)  // abrimos el formulario de edicion
		{
			if(validation_errors() == "")
			{
				$this->session->set_flashdata('error', validation_errors());
			}
			$selecttype = array(1 => 'Imagen', 2 => 'Texto', 3 => 'Slider Imagenes', 4 => 'Audio', 5 => 'Video');
			if(!empty($idItem))  // si se envia un dato por la URL se hace lo siguiente (Edita)
			{
				$idItem or redirect('admin/advance_news');

				$titulo = 'Editar Noticia';
				$datosForm = $this->advance_news_m->get($idItem);

				$positionadvance_news = $this->advance_news_m
				->order_by('position', 'ASC')
				->where('lang', $lang_admin)
				->get_all();
				
				$comments = $this->advance_news_comments_m
					->where('id_advance_new', $datosForm->id)
			        ->order_by('id','DESC')
			        ->get_all();
				
				$this->template
					->set('datosForm', $datosForm)
					->set('positionadvance_news', $positionadvance_news)
					->set('comments', $comments)
					->set('titulo', $titulo)
					->set('ban', true)
					->set('lang_admin', $lang_admin)
					->set('selecttype', $selecttype)
					->build('admin/edit');
			}
			else
			{
				$titulo = 'Crear noticia';

				$this->template
				->set('titulo', $titulo)
				->set('ban', false)
				->set('lang_admin', $lang_admin)
				->set('selecttype', $selecttype)
				->build('admin/edit');
			}
		}
		else // si el formulario ha sido enviado con éxito se procede
		{
			if(!empty($idItem))  // si se envia un dato por la URL se hace lo siguiente (Edita)
			{
				$post = (object) $this->input->post();
				$advance_news = $this->advance_news_m->where('lang', $lang_admin)->get($post->position_advance_new);

				$data = array(
					'title' => $post->title,
					'slug' => slug($post->title), // Creación de slug's para url's limpias
					'autor' => $post->autor,
					'introduction' => $post->introduction,
					'autor_said' => $post->autor_said,
					'title_said' => $post->title_said,
					'date' => $post->date,
					'video_audio' => html_entity_decode($post->video_audio),
					'content' => html_entity_decode($post->content),
					'position' => $advance_news->position,
					'type' => $post->type,			
					'lang' => $lang_admin,
				);

				$config['upload_path'] = './' . UPLOAD_PATH . '/advance_news';
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$config['max_size'] = 2050;
				$config['encrypt_name'] = true;

				$this->load->library('upload', $config);

	            // imagen uno
				$img = $_FILES['image']['name'];

				if (!empty($img)) {
					if ($this->upload->do_upload('image')) {
						$datos = array('upload_data' => $this->upload->data());
						$path = UPLOAD_PATH . 'advance_news/' . $datos['upload_data']['file_name'];
						$img = array('image' => $path);
						$data = array_merge($data, $img);
						$obj = $this->db->where('id', $idItem)->get('advance_news')->row();
						@unlink($obj->image);
					} else {
						$this->session->set_flashdata('error', $this->upload->display_errors());
						redirect('admin/advance_news/index/'.$lang_admin);
					}
				}

				if ($this->advance_news_m->update($idItem, $data)) {
					// Se actualiza el Orden
					$position = array('position' => $post->position_current);
					$this->advance_news_m->update($advance_news->id, $position);

					$this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
				} else {
					$this->session->set_flashdata('success', lang('home:error_message'));
				}
				redirect('admin/advance_news/index/'.$lang_admin);
			}
			else
			{
				$post = (object) $this->input->post();

				$this->db->select_max('position');
				$query = $this->db->where('lang', $lang_admin)->get('advance_news');
				$position = $query->row();

				$data = array(
					'title' => $post->title,
					'slug' => slug($post->title), // Creación de slug's para url's limpias
					'autor' => $post->autor,
					'introduction' => $post->introduction,
					'autor_said' => $post->autor_said,
					'title_said' => $post->title_said,
					'video_audio' => html_entity_decode($post->video_audio),
					'content' => html_entity_decode($post->content),
					'date' => date("Y-m-d H:i:s"),
					'position' => $position->position + 1,
					'type' => $post->type,
					'lang' => $lang_admin,
				);

				$config['upload_path'] = './' . UPLOAD_PATH . '/advance_news';
				$config['allowed_types'] = 'gif|jpg|png|jpeg';
				$config['max_size'] = 2050;
				$config['encrypt_name'] = true;

				$this->load->library('upload', $config);

	            // imagen uno
				$img = $_FILES['image']['name'];

				if (!empty($img)) {
					if ($this->upload->do_upload('image')) {
						$datos = array('upload_data' => $this->upload->data());
						$path = UPLOAD_PATH . 'advance_news/' . $datos['upload_data']['file_name'];
						$img = array('image' => $path);
						$data = array_merge($data, $img);
					} else {
						$this->session->set_flashdata('error', $this->upload->display_errors());
						redirect('admin/advance_news/index/'.$lang_admin);
					}
				}

				if ($this->advance_news_m->insert($data)) {
					$this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
				} else {
					$this->session->set_flashdata('success', lang('home:error_message'));
				}
				redirect('admin/advance_news/index/'.$lang_admin);
			}
		}

	}

	public function delete_advance_new($id = null, $lang_admin = 'es') {

		$id or redirect('admin/advance_news');

		$obj = $this->db->where('id', $id)->get($this->db->dbprefix.'advance_news')->row();

		if ($this->advance_news_m->delete($id)) {
			@unlink($obj->image);
			$this->session->set_flashdata('success', 'El registro se elimino con éxito.');
		} else {
			$this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
		}
		redirect('admin/advance_news/index/'.$lang_admin);
	}
	
	public function delete_comment($id = null, $lang_admin = 'es') {

		$id or redirect('admin/advance_news');

		if ($this->advance_news_comments_m->delete($id)) {
			$this->session->set_flashdata('success', 'El registro se elimino con éxito.');
		} else {
			$this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
		}
		redirect('admin/advance_news/index/'.$lang_admin);
	}
	
	public function outstanding_advance_news($idItem = null, $lang_admin = 'es')
	{
		$amount = $this->advance_news_m->where('lang', $lang_admin)->where('outstanding', 1)->get_all();
		$amount = count($amount);
		$obj = $this->db->where('id', $idItem)->get('advance_news')->row();
	    $data['outstanding'] = ($obj->outstanding == 1 ? 0 : 1);
		
		if($amount < 3 || $data['outstanding'] == 0)
		{
			
	        if ($this->advance_news_m->update($idItem, $data))
			{
	            $statusJson = '';
				$msgJson = 'El producto ahora es destacado.';
	        }
	        else
	        {
	            $statusJson = 'error';
				$msgJson = 'Ocurrio un error al cambiar el estado a destacado';
	        }
		}
		else {
			$statusJson = 'error';
			$msgJson = 'Ya llegaste al numero limite de destacados';
		}
		echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
		
	}
	
	public function edit_comment($idItem = null, $lang_admin = 'es')
	{
		$this->form_validation->set_rules('email', 'Correo', 'required|max_length[100]|trim');
		$this->form_validation->set_rules('name', 'Nombre', 'required|max_length[100]|trim');
		$this->form_validation->set_rules('comment', 'Comentario', 'required|trim');

		if($this->form_validation->run()!==TRUE)  // abrimos el formulario de edicion
		{
			if(validation_errors() == "")
			{
				$this->session->set_flashdata('error', validation_errors());
			}
			if(!empty($idItem))  // si se envia un dato por la URL se hace lo siguiente (Edita)
			{
				$idItem or redirect('admin/advance_news');

				$titulo = 'Editar Comenatario';
				$datosForm = $this->advance_news_comments_m->get($idItem);

				$this->template
				->set('datosForm', $datosForm)
				->set('titulo', $titulo)
				->set('lang_admin', $lang_admin)
				->build('admin/edit_comment');
			}
		}
		else // si el formulario ha sido enviado con éxito se procede
		{
			if($idItem != null)  // si se envia un dato por la URL se hace lo siguiente (Edita)
			{

				$post = (object) $this->input->post();

				$data = array(
					'email' => $post->email,
					'name' => $post->name,
					'comment' => $post->comment,
					);


				if ($this->advance_news_comments_m->update($idItem, $data)) {
					$this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
					redirect('admin/advance_news/'.$lang_admin);
				} else {
					$this->session->set_flashdata('success', lang('home:error_message'));
					redirect('admin/advance_news/'.$lang_admin);
				}
			}
		}

	}

	/*
     * Administración de imagenes
     */

    public function images($id = null) {
        $id or redirect('admin/advance_news');
        // Se consultan las imagenes del advance_new
		$images = $this->db->where('advance_new_id', $id)->get('advance_news_images')->result();
		$advance_new = $this->db->where('id', $id)->get('advance_news')->row();

        $this->template
        ->set('advance_new', $advance_new)
        ->set('images', $images)
        ->build('admin/images');
    }

    // ----------------------------------------------------------------------------------

    public function create_image($id = null) {
        $id or redirect('admin/advance_news');
		$advance_new = $this->db->where('id', $id)->get('advance_news')->row();
		
        $this->template
        ->set('advance_new', $advance_new)
        ->build('admin/create_image');
    }
	
	public function create_video($id = null) {
        $id or redirect('admin/advance_news');
        $advance_new = $this->db->where('id', $id)->get('advance_news')->row();
		
        $this->template
        ->set('advance_new', $advance_new)
        ->build('admin/create_video');
    }
	
    // -----------------------------------------------------------------

    public function store_image()
    {
    	// Se carga la imagen
        $config['upload_path'] = './' . UPLOAD_PATH . '/advance_news';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;

        $this->load->library('upload', $config);

        $id = $this->input->post('id');
		
		if(isset($_POST['video']))
		{
			$post = (object) $this->input->post();
			$image = array(
                'video' => $post->video,
                'advance_new_id' => $id,
                );
		}
		else
		{
			    // imagen uno
	        $img = $_FILES['image']['name'];
	        $image = array();
	        
	
	        if (!empty($img)) {
	            if ($this->upload->do_upload('image')) {
	                $datos = array('upload_data' => $this->upload->data());
	                $path = UPLOAD_PATH . 'advance_news/' . $datos['upload_data']['file_name'];
	                $image = array(
	                    'advance_new_id' => $id,
	                    'path' => $path
	                    );
	            } else {
	                $this->session->set_flashdata('error', $this->upload->display_errors());
	                redirect('admin/advance_news/images/'.$id);
	            }
	        }
		}
		
            // Se inserta en la base de datos
        if ($this->db->insert('advance_news_images', $image)) {
            $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            redirect('admin/advance_news/images/'.$id);
        } else {
            $this->session->set_flashdata('error', lang('galeria:error_message'));
            redirect('admin/advance_news/create_image/'.$id);
        }
    }

    // -----------------------------------------------------------------

    public function destroy_image($id = null,$advance_new_id = null) {
        $id or redirect('admin/advance_news');
        $advance_new_id or redirect('admin/advance_news');
		$obj = $this->db->where('id', $id)->get('advance_news_images')->row();
		if ($this->db->where('id', $id)->delete('advance_news_images'))
        {
            @unlink($obj->path); // Eliminamos archivo existente
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/advance_news/images/'.$advance_new_id);
    }
}
