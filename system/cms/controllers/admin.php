<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * The admin class is basically the main controller for the backend.
 *
 * @author      PyroCMS Dev Team
 * @copyright   Copyright (c) 2012, PyroCMS LLC
 * @package	 	PyroCMS\Core\Controllers
 */
class Admin extends Admin_Controller {

    /**
     * Constructor method
     */
    public function __construct() {
        parent::__construct();
        $this->lang_admin = 'es';

        $this->load->helper('users/user');
    }

    /**
     * Show the control panel
     */
    public function index() {

        $this->template
                ->enable_parser(true)
                ->title(lang('global:dashboard'));

        if (is_dir('./installer')) {
            $this->template
                    ->set('messages', array('notice' => '<button id="remove_installer_directory" class="button">' . lang('cp:delete_installer') . '</button>' . lang('cp:delete_installer_message')));
        }

        $post = (object) $this->input->post();
        if (!empty($post->lang)) {
            $this->lang_admin = $post->lang == 'es' ? 'es' : 'en';
        }
//        var_dump($this->lang_admin);
        $total_messages = $this->db->where('lang', ($this->lang_admin == 'es') ? 'es' : 'en')->get('contact_us_emails')->result();
        $pagination = create_pagination('admin/index/', count($total_messages), 20, 3);
        $contact_us_emails = $this->db
                ->where('lang', $this->lang_admin == 'es' ? 'es' : 'en')
                ->limit($pagination['limit'], $pagination['offset'])
                ->order_by('date', 'DESC')
                ->get('contact_us_emails')
                ->result();
//        echo '<pre>' . $this->db->last_query() . '<br>';
        foreach ($contact_us_emails as $item) {
            if ($item->status == 0) {
                $item->color = 'style="background:#ffc !important"';
            } else {
                $item->color = '';
            }
        }
        
        $quiz = $this->db->get('quiz')->result();
        
//        var_dump($contact_us_emails);
//        die;
        $this->template
                ->set('contact', $contact_us_emails)
                ->set('lang_admin', ($this->lang_admin == 'es') ? 'es' : 'en')
                ->set('pagination', $pagination)
                ->set('quiz', $quiz)
                ->build('admin/dashboard');
    }
   
    /**
     * Log in
     */
    public function login() {
        // Set the validation rules
        $this->validation_rules = array(
            array(
                'field' => 'email',
                'label' => lang('global:email'),
                'rules' => 'required|callback__check_login'
            ),
            array(
                'field' => 'password',
                'label' => lang('global:password'),
                'rules' => 'required'
            )
        );

        // Call validation and set rules
        $this->load->library('form_validation');
        $this->form_validation->set_rules($this->validation_rules);

        // If the validation worked, or the user is already logged in
        if ($this->form_validation->run() or $this->ion_auth->logged_in()) {
            // if they were trying to go someplace besides the 
            // dashboard we'll have stored it in the session
            $redirect = $this->session->userdata('admin_redirect');
            $this->session->unset_userdata('admin_redirect');

            redirect($redirect ? $redirect : 'admin');
        }

        $this->template
                ->set_layout(false)
                ->build('admin/login');
    }

    /**
     * Logout
     */
    public function logout() {
        $this->load->language('users/user');
        $this->ion_auth->logout();
        $this->session->set_flashdata('success', lang('user:logged_out'));
        redirect('admin/login');
    }

    /**
     * Callback From: login()
     *
     * @param string $email The Email address to validate
     *
     * @return bool
     */
    public function _check_login($email) {
        if ($this->ion_auth->login($email, $this->input->post('password'), (bool) $this->input->post('remember'))) {
            Events::trigger('post_admin_login');

            return true;
        }

        Events::trigger('login_failed', $email);
        error_log('Login failed for user ' . $email);

        $this->form_validation->set_message('_check_login', $this->ion_auth->errors());
        return false;
    }

    /**
     * Display the help string from a module's
     * details.php file in a modal window
     *
     * @param	string	$slug	The module to fetch help for
     *
     * @return	void
     */
    public function help($slug) {
        $this->template
                ->set_layout('modal', 'admin')
                ->set('help', $this->module_m->help($slug))
                ->build('admin/partials/help');
    }

    public function remove_installer_directory() {
        if (!$this->input->is_ajax_request()) {
            die('Nope, sorry');
        }

        header('Content-Type: application/json');

        if (is_dir('./installer')) {
            $this->load->helper('file');
            // if the contents of "installer" delete successfully then finish off the installer dir
            if (delete_files('./installer', true) and count(scandir('./installer')) == 2) {
                rmdir('./installer');
                // This is the end, tell Sally I loved her.
                die(json_encode(array('status' => 'success', 'message' => lang('cp:delete_installer_successfully_message'))));
            }
        }

        die(json_encode(array('status' => 'error', 'message' => lang('cp:delete_installer_manually_message'))));
    }

}
