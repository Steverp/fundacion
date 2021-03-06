<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_Faqs extends Module {

    public $version = '1.2';
    public $mainTable = 'faqs';
    public $chilTable = 'faq_categories';
    public $relationship = 'faqs_categories';
    public $intro = 'faqs_intro';

    public function info() {
        return array(
            'name' => array(
                'en' => 'FAQ',
                'es' => 'Preguntas Frecuentes'
            ),
            'description' => array(
                'en' => 'FAQ © Brayan Acebo, luis fernando salazar 2014',
                'es' => 'Preguntas Frecuentes © Brayan Acebo, luis fernando salazar 2014',
            ),
            'frontend' => TRUE,
            'backend' => TRUE,
            'menu' => 'content'
        );
    }

    public function install() {

        /* Creación del directorio para carga de imagenes */
        @mkdir($this->upload_path . $this->mainTable, 0777, TRUE);

        /* Creación de tabla para las categorias */
        $this->dbforge->drop_table($this->chilTable);

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'title' => array(
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false
            ),
            'position' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => true
            ),
            'parent' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => false
            ),
            'slug' => array(
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => false
            ),
            'created_at' => array(
                'type' => 'DATETIME',
                'constraint' => '',
                'null' => false
            ),
            'updated_at' => array(
                'type' => 'TIMESTAMP',
                'constraint' => '',
                'null' => false
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

        if (!$this->dbforge->create_table($this->chilTable)) {
            return false;
        }

        // Creando tabla de FAQ

        $this->dbforge->drop_table($this->mainTable);

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
            ),
            'slug' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'description' => array(
                'type' => 'TEXT',
                'null' => true
            ),
            'position' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => true
            ),
            'created_at' => array(
                'type' => 'DATETIME',
                'constraint' => '',
                'null' => false
            ),
            'updated_at' => array(
                'type' => 'TIMESTAMP',
                'constraint' => '',
                'null' => false
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

        if (!$this->dbforge->create_table($this->mainTable)) {
            return false;
        }


        // Tabla para introducción de la sección

        $this->dbforge->drop_table($this->intro);

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'text' => array(
                'type' => 'TEXT',
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

        if (!$this->dbforge->create_table($this->intro)) {
            return false;
        }

        $data = array(
            'text' => ''
        );

        $this->db->insert($this->intro, $data);

        // Tabla para introducción de la sección

        $this->dbforge->drop_table($this->relationship);

        $field = array(
            'faq_id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => false
            ),
            'category_id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => false
            )
        );

        $this->dbforge->add_field($field);

        if (!$this->dbforge->create_table($this->relationship)) {
            return false;
        }

        // Final
        return true;
    }

    public function uninstall() {
        $this->dbforge->drop_table($this->chilTable);
        $this->dbforge->drop_table($this->mainTable);
        $this->dbforge->drop_table($this->relationship);
        $this->dbforge->drop_table($this->intro);
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Modulo de Preguntas frecuentes con arbol de categorias";
    }

}

/* Fin del archivo details.php */