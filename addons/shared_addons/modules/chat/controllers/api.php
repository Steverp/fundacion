<?php

/**
 * API Controller for REST requests
 *
 * @author 	Rigo B Castro - Imaginamos Dev Team
 * @website     http://www.imaginamos.com
 * @website     http://rigobcastro.com
 * @package 	PyroCMS
 * @subpackage 	Chat Module
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Api extends REST_Controller {

    private $namespace = 'chat';
    private $new_messages = array();
    private static $try = 0;
    private $assign = false;
    protected $methods = array(
        'save_first_room_get' => array(
            'log' => false,
            'key' => false
        ),
        'check_status_online_get' => array(
            'log' => false,
            'key' => false
        ),
        'bind_get' => array(
            'log' => false,
            'key' => false
        ),
        'send_message_get' => array(
            'log' => false,
            'key' => false
        ),
        'last_rooms_without_assign_get' => array(
            'log' => false,
            'key' => false
        ),
    );

    public function __construct()
    {
        parent::__construct();

        $this->datetime = new DateTime('now');
        
        date_default_timezone_set('America/Bogota');
    }

    // ----------------------------------------------------------------------

    public function save_first_room_get()
    {
        $data = array(
            'assign_name' => $this->get('name_chat'),
            'assign_email' => $this->get('email_chat'),
            'assign_building_id' => $this->get('building_id_chat'),
            'assign_status' => 'wait'
        );

        $new_assign_id = $this->streams->entries->insert_entry($data, 'assign', $this->namespace);

        $status = !empty($new_assign_id);

        if ($status)
        {
            $message_data = array(
                'message_text' => $this->get('message_text'),
                'message_assign_id' => $new_assign_id,
                'message_sender' => 'client',
                'message_username' => $this->get('name_chat')
            );

            $status = (bool) $this->streams->entries->insert_entry($message_data, 'message', $this->namespace);
        }

        return $this->response(array(
                'status' => $status,
                'new_assign_id' => $new_assign_id,
                'awaiting_message' => lang('chat:awaiting_message')
        ));
    }

    // ----------------------------------------------------------------------

    public function check_status_online_get()
    {
        return $this->response($this->_check_status_online());
    }

    // ----------------------------------------------------------------------

    public function bind_get()
    {
        // Its magic shit!
        session_write_close();

        $this->data_status = $this->_check_status_online();
        $first_load = $this->get('first') == 'true' ? true : false;

        // Check assign and its messages
        $this->_check_status_message();

        $assign_exists = $this->assign['exists'];

        if ($assign_exists)
        {
            while (!$this->_has_new_messages($first_load)) {
                sleep(3);
            }

            // Again for loop while
            $this->_check_status_message();
        } else {
            // Prevent request collapse!
            sleep(5);
        }

        $data_messages = array(
            'messages' => $this->new_messages,
            'assing' => $this->assign,
            'first' => $first_load,
            'assign_exists' => $assign_exists,
            'assign_status' => $assign_exists ? $this->assign['status'] : false,
            'is_close' => $assign_exists ? $this->assign['close'] : false,
            'is_online' => $assign_exists ? $this->assign['active'] : false
        );

        return $this->response(array_merge($this->data_status, $data_messages));
    }

    // ----------------------------------------------------------------------

    public function send_message_get()
    {
        $message = $this->get('message');
        $sender = $this->get('sender');
        $assign_id = $this->get('assign_id');
        $username = 'Asesor';

        $assign = $this->chat_assign_m->get_by('id', $assign_id);

        switch ($sender) {
            case 'client':
                $username = $assign->assign_name;
                break;

            case 'admin':
                $user = $this->ion_auth->get_user($assign->assign_user_id);
                $username = $user->username;
                break;

            default:
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

        return $this->response(array(
                'status' => !empty($saved),
                'message' => array(
                    'username' => $username,
                    'message' => $message,
                    'sender' => $sender
                )
        ));
    }

    // ----------------------------------------------------------------------

    private function _check_status_message()
    {
        $data_status = & $this->data_status;

        if ($data_status['status'] && $this->get('assign_id'))
        {
            $this->assign = $this->_check_assign($this->get('assign_id'));

            if ($this->assign['wait'])
            {
                $data_status['message'] = lang('chat:awaiting_message');
            }
            elseif ($this->assign['close'])
            {
                $data_status['message'] = sprintf(lang('chat:is_close'), $this->assign['finished_on']);
            }
            else
            {
                $admin = $this->ion_auth->get_user($this->assign['user']);

                $data_status['message'] = sprintf(lang('chat:is_online_with_online'), $admin->display_name);
            }
        }
    }

    private function _has_new_messages($first_load)
    {
        self::$try++;

        if (self::$try >= 10)
        {
            return true;
        }

        $messages = $this->_get_messages($this->get('assign_id'), $first_load);

        $this->new_messages = $messages;

        return !empty($messages);
    }

    // ----------------------------------------------------------------------

    private function _check_assign($assign_id)
    {
        $assign_entry = $this->chat_assign_m->get_by('id', $assign_id);

        return array(
            'id' => !empty($assign_entry->id) ? $assign_entry->id : null,
            'user' => !empty($assign_entry->assign_user_id) ? $assign_entry->assign_user_id : null,
            'wait' => empty($assign_entry->assign_user_id),
            'exists' => !empty($assign_entry),
            'status' => $assign_entry->assign_status,
            'close' => !empty($assign_entry->assign_finished_on) && $assign_entry->assign_status == 'close',
            'active' => !empty($assign_entry->assign_start_on) && $assign_entry->assign_status == 'active',
            'finished_on' => $assign_entry->assign_finished_on
        );
    }

    // ----------------------------------------------------------------------

    private function _check_status_online()
    {
        $schedule = $this->chat_m->get_by_current_day();


        $online = !empty($schedule);
        $message = lang('chat:is_offline');

        if ($online)
        {
            $message = lang('chat:is_online');
        }

        return array(
            'status' => (bool) $online,
            'message' => $message
        );
    }

    // ----------------------------------------------------------------------

    public function _get_messages($assign_id, $first_load = true)
    {
        $where = array(
            'message_assign_id' => $assign_id
        );

        if (!$first_load)
        {
            if (!$this->get('last_id'))
            {
                return false;
            }

            $where['id > '] = $this->get('last_id');
        }

        $entries = $this->chat_message_m->get_many_by($where);


        $out = array();

        if (!empty($entries))
        {
            foreach ($entries as $entry)
            {
                $sender = $entry->message_sender;
                $datetime = new DateTime($entry->created);

                $out[$entry->id] = array(
                    'id' => $entry->id,
                    'sender' => $sender,
                    'message' => $entry->message_text,
                    'username' => $entry->message_username,
                    'datetime' => $datetime->format('Y-m-d H:i:s'),
                    'datetime_iso' => $datetime->format(DATE_ISO8601),
                    'is_client' => ($sender == 'client'),
                    'is_own' => ($this->get('sender') == $sender)
                );
            }
        }

        return $out;
    }

    // ----------------------------------------------------------------------
}

