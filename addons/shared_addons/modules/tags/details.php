<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_Tags extends Module {

    public $version = '1.0';

    public function info() {
        return array(
            'name' => array(
                'es' => 'Tags',
                'en' => 'Tags'
            ),
            'description' => array(
                'es' => 'Tags libres listo para relacionar a varios modulos',
                'en' => 'Tags libres listo para relacionar a varios modulos'
            ),
            'frontend' => false,
            'backend' => true,
            'menu' => 'content',
        );
    }

    public function install() {

        /* Creación de tabla para las prensa */

        $this->dbforge->drop_table('tags');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            )
        );

        $this->dbforge->add_field($field);
        $this->dbforge->add_key('id', true);

        if (!$this->dbforge->create_table('tags')) {
            return false;
        }

        return true;
    }

    public function uninstall() {
        $this->dbforge->drop_table('tags');
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Tags libres listo para relacionar a varios modulos";
    }

}