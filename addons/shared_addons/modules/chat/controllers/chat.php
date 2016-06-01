<?php

defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Public Services module controller
 *
 * @author Eduard Russy
 * @author Rigo B Castro
 */
class Chat extends Public_Controller {

    protected $namespace = 'chat';
    protected $slug_stream = 'assign';

    /**
     * Every time this controller is called should:
     * - load the blog and blog_categories models.
     * - load the keywords library.
     * - load the blog language file.
     */
    public function __construct()
    {
        parent::__construct();
        // Load all the required classes
        $this->load->model('chat_m');
    }

    // ----------------------------------------------------------------------

    public function assign()
    {
        if (group_has_role('chat', 'front_assign'))
        {
            $this->template->title('Conversaciones del chat');
            
            $check_last_url = 'admin/chat/assign/last_rooms_without_assign';

            return $this->template
                ->set('check_last_url', $check_last_url)
                ->build('assign');
        }
        else
        {
            return show_404();
        }
    }

    // ----------------------------------------------------------------------

    public function room($id = null)
    {
        $entry = $this->streams->entries->get_entry($id, $this->slug_stream, $this->namespace, false);

        if (!empty($entry->assign_user_id))
        {
            if ($entry->assign_user_id != $this->current_user->id)
            {
                return show_error('El usuario ya fue asignado');
            }
        }
        else
        {
            $entry_data = array(
                'assign_user_id' => $this->current_user->id,
                'assign_status' => 'active',
                'assign_start_on' => date('Y-m-d H:i:s'),
            );

            $this->streams->entries->update_entry($id, $entry_data, $this->slug_stream, $this->namespace);
        }

        $this->template->set('assign', $entry);

        $this->template->append_js('core::libs/handlebars.js');
        $this->template->append_js('core::plugins/jquery.timeago.js');
        $this->template->append_js('core::plugins/jquery.timeago.locale.es.js');
        $this->template->append_js('module::room.js');


        $this->template->title("Conversación #{$id}");

        return $this->template->build('room');
    }

    // ----------------------------------------------------------------------

    public function send_message()
    {
        $message = $this->input->post('message');
        $sender = $this->input->post('sender');
        $assign_id = $this->input->post('assign_id');
        $username = 'Asesor';

        $assign = $this->chat_assign_m->get_by('id', $assign_id);

        switch ($sender) {
            case 'client':
                $username = $assign->assign_name;
                break;

            default:
                # code...
                break;
        }

        $data = array(
            'message_text' => $message,
            'message_sender' => $sender,
            'message_assign_id' => $assign_id,
            'message_username' => $username,
            'created' => date('Y-m-d H:i:s')
        );

        $saved = $this->chat_message_m->insert($data);

        return $this->template->build_json(array(
                'status' => !empty($saved),
                'message' => array(
                    'username' => $username,
                    'message' => $message,
                    'sender' => $sender
                )
        ));
    }

    // ----------------------------------------------------------------------

    public function validate()
    {
        // Valida Login
        $login = $this->ion_auth->logged_in();
        $data = array();
        if ($login)
        {
            $user = $this->ion_auth->profile();
            $data = array('name' => $user->display_name, 'email' => $user->email);
        }

        // Valida si esta disponible el chat
        $var = $this->session->userdata('in_chat');
        if (!isset($var))
        {
            $in_chat = FALSE;
            $this->session->set_userdata('in_chat', true);
            $chat = $this->chat_m->get_by_day(date('D'));

            if (empty($chat))
            {
                $exit = FALSE;
            }
            else
            {
                foreach ($chat as $value)
                {
                    if ($value->start_hour <= date('H:i') && $value->end_hour >= date('H:i'))
                    {
                        $exit = TRUE;
                    }
                    else
                    {
                        $exit = FALSE;
                    }
                }
            }
        }
        else
        {
            $in_chat = TRUE;
        }
        $this->session->unset_userdata('in_chat');
        return $this->template->build_json(array('login' => (int) $login, 'in_chat' => (int) $in_chat, 'chat' => (int) $exit, 'data' => $data));
    }

    // ----------------------------------------------------------------------

    public function set_mail()
    {
        Events::trigger('email', array(
            'name' => 'Michael',
            'sender_username' => $this->input->post('name_chat'),
            'sender_email' => $this->input->post('email_chat'),
            'message' => $this->input->post('message_text'),
            'to' => 'michale.quevedo@imaginamos.co',
            'slug' => 'chat-offline',
            'email' => Settings::get('contact_email')
            ), 'array');

        return $this->template->build_json(1);
    }

}
