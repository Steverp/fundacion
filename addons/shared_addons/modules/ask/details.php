<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_ask extends Module
{

    public $version = '1.3';

    public function info() {
        return array(
            'name' => array(
                'es' => 'Preguntanos',
                'en' => 'Ask',
            ),
            'description' => array(
                'es' => 'Pregunta al experto',
                'en' => 'Ask',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
        );
    }

    public function install() {

        $this->dbforge->drop_table('ask');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'title' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'image' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'video' => array(
                'type' => 'TEXT',
                'null' => true
            ),
            'text' => array(
                'type' => 'LONGTEXT',
                'null' => true
            ),
            'lang' => array(
                'type' => 'VARCHAR',
                'constraint' => '2',
                'null' => true,
                'default' => 'es',
            ),
        );

        $this->dbforge->add_field($field);
        $this->dbforge->add_key('id', true);

        if (!$this->dbforge->create_table('ask')) {
            return false;
        }

        $data = array(
            'title' => '',
            'image' => '',
            'video' => '',
            'text' => '',
            'lang' => 'es'
        );

        $this->db->insert('ask', $data);
		
		$data = array(
            'title' => '',
            'image' => '',
            'video' => '',
            'text' => '',
            'lang' => 'en'
        );

        $this->db->insert('ask', $data);

        $dir = $this->upload_path . 'ask';

        if (!is_dir($dir)) {
            @mkdir($dir, '0777');
            chmod($dir, '0777');
        }

        return true;
    }

    public function uninstall() {
        $this->dbforge->drop_table('ask');
        @rmdir($this->upload_path . 'ask');
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Página de contenido, (texto e imagen) con párrafo introductorio y zona inferior delimitada para 3 campos de destacados administrables.";
    }

}
