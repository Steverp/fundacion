<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * In chat details module
 *
 * @author 	Rigo B Castro - Imaginamos Dev Team
 * @website	http://imaginamos.com
 * @package 	PyroCMS
 * @subpackage 	In chat Module
 */
class Module_chat extends Module {

    public $version = '1.2';
    private $namespace = 'chat';
    private $slug_stream = 'chat';
    private $slug_stream_assign = 'assign';
    private $slug_stream_message = 'message';

    public function __construct()
    {
        $this->load->driver('Streams');
        $this->load->library('files/files');
    }

    // ----------------------------------------------------------------------

    public function info()
    {
        if (group_has_role('chat', 'admin_schedule'))
        {
            $sections['admin_chat'] = array(
                'name' => $this->namespace . ':schedule:title',
                'uri' => "admin/{$this->namespace}",
                'shortcuts' => array(
                    'create' => array(
                        'name' => $this->namespace . ':new',
                        'uri' => "admin/{$this->namespace}/create",
                        'class' => 'add'
                    )
                )
            );
        }

        if (group_has_role('chat', 'admin_assign'))
        {

            $sections['admin_assign'] = array(
                'name' => $this->namespace . ':assign:title',
                'uri' => "admin/{$this->namespace}/assign/index"
            );
        }



        return array(
            'name' => array(
                'en' => 'Chat',
                'es' => 'Chat Interno'
            ),
            'description' => array(
                'en' => 'This is a PyroCMS module chat.',
                'es' => 'Administrador de chat principal.'
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
            'roles' => array('admin_schedule', 'admin_assign', 'front_assign', 'front_assign_all'),
            'sections' => $sections
        );
    }

    public function install()
    {
        $this->_clear_info();

        // Create Streams 

        if (!$this->streams->streams->add_stream("lang:{$this->namespace}:title", $this->slug_stream, $this->namespace))
            return false;

        if ($assign_stream_id = !$this->streams->streams->add_stream("lang:{$this->namespace}:title", $this->slug_stream_assign, $this->namespace, $this->slug_stream . '_', null))
            return false;

        if (!$this->streams->streams->add_stream("lang:{$this->namespace}:title", $this->slug_stream_message, $this->namespace, $this->slug_stream . '_', null))
            return false;

        // ==== Create Streams Fields

        $fields = array(
            array(
                'name' => "lang:{$this->namespace}:day",
                'slug' => 'day',
                'namespace' => $this->namespace,
                'type' => 'choice',
                'extra' => array('choice_data' => '
                    Mon : Lunes
                    Tue : Martes
                    Wed : Miércoles
                    Thu : Jueves
                    Fri : Viernes
                    Sat : Sábado
                    Sun : Domingo',
                    'choice_type' => 'dropdown'
                ),
                'assign' => $this->slug_stream,
                'title_column' => true,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:start_hour",
                'slug' => 'start_hour',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:end_hour",
                'slug' => 'end_hour',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream,
                'required' => true
            ),
            array(
                'name' => "lang:name_label",
                'slug' => $this->slug_stream_assign . '_name',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream_assign,
                'title_column' => true,
                'required' => true
            ),
            array(
                'name' => "lang:global:email",
                'slug' => $this->slug_stream_assign . '_email',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream_assign,
                'title_column' => true,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:user",
                'slug' => $this->slug_stream_assign . '_user_id',
                'namespace' => $this->namespace,
                'type' => 'user',
                'assign' => $this->slug_stream_assign,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:status",
                'slug' => $this->slug_stream_assign . '_status',
                'namespace' => $this->namespace,
                'type' => 'choice',
                'extra' => array('choice_data' => '0 : 0
                    1 : 1', 'choice_type' => 'dropdown'),
                'assign' => $this->slug_stream_assign,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:start_date",
                'slug' => $this->slug_stream_assign . '_start_on',
                'namespace' => $this->namespace,
                'type' => 'datetime',
                'assign' => $this->slug_stream_assign,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:end_date",
                'slug' => $this->slug_stream_assign . '_finished_on',
                'namespace' => $this->namespace,
                'type' => 'datetime',
                'assign' => $this->slug_stream_assign,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:message",
                'slug' => $this->slug_stream_message . '_text',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream_message,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:assing",
                'slug' => $this->slug_stream_message . '_assign_id',
                'namespace' => $this->namespace,
                'type' => 'relationship',
                'extra' => array('choose_stream' => $assign_stream_id),
                'assign' => $this->slug_stream_message,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:sender",
                'slug' => $this->slug_stream_message . '_sender',
                'namespace' => $this->namespace,
                'type' => 'choice',
                'extra' => array(
                    'choice_data' => 'client : client
                    admin : admin', 'choice_type' => 'dropdown'
                ),
                'assign' => $this->slug_stream_message,
                'required' => true
            ),
            array(
                'name' => "lang:{$this->namespace}:username",
                'slug' => $this->slug_stream_message . '_username',
                'namespace' => $this->namespace,
                'type' => 'text',
                'assign' => $this->slug_stream_message,
                'required' => true
            )
        );
        if (!$this->streams->fields->add_fields($fields))
        {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        // This is a core module, lets keep it around.
        return $this->_clear_info();
    }

    public function upgrade($old_version)
    {
        return true;
    }

    /**
     * Clear info of module (Reset)
     * 
     * @return boolean
     */
    private function _clear_info()
    {
        // Check foreign keys false
        $this->db->query('SET foreign_key_checks = 0;');
        $this->streams->utilities->remove_namespace($this->namespace);
        if ($this->db->table_exists('data_streams'))
        {
            $this->db->where('stream_namespace', $this->namespace)->delete('data_streams');
        }; {
            $this->db->query('SET foreign_key_checks = 1;');
            return true;
        }
    }

}