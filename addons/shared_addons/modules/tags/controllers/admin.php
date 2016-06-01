<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Brayan Acebo
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('tags');
        $models = array(
            'tags_model'
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index() {

        // Paginación
        $pagination = create_pagination('admin/tags/index', $this->tags_model->count_all(), 10);

        $tags = $this->tags_model
                ->limit($pagination['limit'], $pagination['offset'])
                ->get_all();

        $this->template
                ->set('pagination', $pagination)
                ->set('tags', $tags)
                ->build('admin/index');
    }

    // -----------------------------------------------------------------

    public function create() {
        $tags = $this->tags_model->get_all();
        $this->template
                ->set('tags', $tags)
                ->build('admin/create');
    }

    // -----------------------------------------------------------------

    public function store() {

        $this->form_validation->set_rules('name', 'Nombre', 'required|max_length[200]');

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();
            $data = array(
                'name' => $post->name
            );


            if ($this->tags_model->insert($data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/tags/');
            } else {
                $this->session->set_flashdata('success', lang('tags:error_message'));
                return $this->create();
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            return $this->create();
        }
    }

    // -----------------------------------------------------------------

    public function edit($id = null) {

        $id or redirect('admin/tags'); 

        $tag = $this->tags_model->get($id);

        $this->template
                ->set('tag', $tag)
                ->build('admin/edit');
    }

    // -----------------------------------------------------------------

    public function update() {

        $this->form_validation->set_rules('name', 'Nombre', 'required|max_length[200]');

        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            $data = array(
                'name' => $post->name
            );

            if ($this->tags_model->update($post->id, $data)) {
                $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
                redirect('admin/tags/');
            } else {
                $this->session->set_flashdata('success', lang('tags:error_message'));
                return $this->edit();
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            return $this->edit();
        }
    }

    // -----------------------------------------------------------------

    public function destroy($id = null) {
        $id or redirect('admin/tags/');
        $obj = $this->db->where('id', $id)->get('tags')->row();
        if ($this->tags_model->delete($id)) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/tags/');
    }

}