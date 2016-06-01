<?php

defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * @author  PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Blog\Controllers
 */
class Admin_assign extends Admin_Controller {

    protected $section = 'admin_assign';
    protected $namespace = 'chat';
    protected $slug_stream = 'assign';
    private $_tabs = array();

    public function __construct()
    {
        parent::__construct();
    }

    // ----------------------------------------------------------------------

    public function index()
    {
        role_or_die('chat', 'admin_assign');

        return $this->template->build('admin/index');
    }

    // ----------------------------------------------------------------------

    public function last_rooms_without_assign()
    {
        $is_front = (bool) $this->input->get('is-front');

        if ($is_front)
        {
            role_or_die('chat', 'front_assign');
            
        }
        else
        {
            role_or_die('chat', 'admin_assign');
        }

        $room_url = ($is_front ? "{$this->namespace}/room/-entry_id-/" . md5(time()) : "admin/{$this->namespace}/assign/room/-entry_id-/" );

        $extra['title'] = "lang:{$this->namespace}:table_title";

        $extra['buttons'] = array(
            array(
                'label' => lang('chat:join_room_label'),
                'url' => $room_url,
                'class' => 'join-assign'
            )
        );

        $extra['no_entries_message'] = lang("{$this->namespace}:no_assigns_message");
        $extra['columns'] = array('id', 'assign_name', 'assign_email', 'created');

        $_GET['f-exact-assign_status'] = 'wait';

        $wait_table = $this->streams->cp->entries_table('assign', $this->namespace, 20, "admin/{$this->namespace}/index", false, $extra);

        $_GET['f-exact-assign_status'] = 'active';

        $extra['columns'] = array('id', 'assign_name', 'assign_email', 'created');

        $extra['buttons'] = array(
            array(
                'label' => lang('chat:re-join_room_label'),
                'url' => $room_url,
                'class' => 'join-assign'
            )
        );

        $active_table = $this->streams->cp->entries_table('assign', $this->namespace, 20, "admin/{$this->namespace}/index", false, $extra);
        
        return $this->template->build_json(array(
                'wait_table' => $wait_table,
                'active_table' => $active_table
        ));
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

        return $this->template->build('admin/room');
    }

    // ----------------------------------------------------------------------

    public function close_room($id = null)
    {
        $entry_data = array(
            'assign_finished_on' => date('Y-m-d H:i:s'),
            'assign_status' => 'close'
        );

        if ($this->streams->entries->update_entry($id, $entry_data, $this->slug_stream, $this->namespace))
        {
            $this->session->set_flashdata('success', lang('chat:confirm_close_room'));

            $message_data = array(
                'message_sender' => 'admin',
                'message_username' => 'Asesor',
                'message_text' => 'La conversación ha finalizado, fue un placer atenderlo.',
                'message_assign_id' => $id
            );

            $this->streams->entries->insert_entry($message_data, 'message', $this->namespace);
        }

        return redirect($this->input->get('return_to') ? $this->input->get('return_to') : 'admin/chat/assign/index');
    }

    // ----------------------------------------------------------------------

    /**
     * Delete a FAQ entry
     * 
     * @param   int [$id] The id of FAQ to be deleted
     * @return  void
     */
    public function delete($id = null, $page = 1)
    {
        $this->streams->entries->delete_entry($id, $this->slug_stream, $this->namespace);
        $this->session->set_flashdata('error', lang("{$this->namespace}:deleted"));

        return redirect("admin/{$this->namespace}/index/{$page}");
    }

}
