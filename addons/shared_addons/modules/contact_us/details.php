<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_Contact_Us extends Module {

    public $version = '1.3';
    public $mainTable = 'google_maps';
    public $chilTable = 'google_map_categories';
    public $imageTable = 'google_map_images';
    public $relationship = 'google_maps_categories';
    public $intro = 'google_maps_intro';

    public function info() {
        return array(
            'name' => array(
                'es' => 'Datos de Contacto',
                'en' => 'Contactenos'
            ),
            'description' => array(
                'es' => 'Modulo información de contacto, con control de mapas © Brayan Acebo, Luis Fernando Salazar, Christian España',
                'en' => 'Manage Info Data © Christian España , Brayan Acebo, Luis fernando Salazar'
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
        );
    }

    public function install() {
        $this->dbforge->drop_table('contact_us');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'facebook' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'twitter' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'linkedin' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'adress' => array(
                'type' => 'VARCHAR',
                'constraint' => '200',
                'null' => true
            ),
            'phone' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'email' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'map' => array(
                'type' => 'TEXT',
                'null' => true
            ),
            'schedule' => array(
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

        if (!$this->dbforge->create_table('contact_us')) {
            return false;
        }

        // creamos el primer registro
        $data = array(
            'id' => '1',
        );
        $data2 = array(
            'id' => '2',
            'lang' => 'en'
        );

        $this->db->insert('contact_us', $data);
        $this->db->insert('contact_us', $data2);

        // Creando tabla para multiples areas

        $this->dbforge->drop_table('contact_us_emails_area');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'title' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => false
            ),
            'title_en' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'email' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'created_at' => array(
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

        if (!$this->dbforge->create_table('contact_us_emails_area')) {
            return false;
        }

        $this->dbforge->drop_table('contact_us_emails');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'email' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'phone' => array(
                'type' => 'VARCHAR',
                'constraint' => '30',
                'null' => true
            ),
            'cell' => array(
                'type' => 'VARCHAR',
                'constraint' => '30',
                'null' => true
            ),
            'company' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'city' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'message' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'date' => array(
                'type' => 'DATETIME',
                'null' => true
            ),
            'status' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => true,
                'default' => 0
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

        if (!$this->dbforge->create_table('contact_us_emails')) {
            return false;
        }
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
            'outstanding' => array(
                'type' => 'INT',
                'constraint' => '1',
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

        if (!$this->dbforge->create_table($this->chilTable)) {
            return false;
        }

        // Creando tabla de google_maps

        $this->dbforge->drop_table($this->mainTable);

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'adress' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
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
            'schedule' => array(
                'type' => 'TEXT',
                'null' => true
            ),
            'coordinate1' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'coordinate2' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'image' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
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

        $this->dbforge->drop_table($this->relationship);

        $field = array(
            'google_map_id' => array(
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
            )
        );

        $this->dbforge->add_field($field);
        $this->dbforge->add_key('id', true);

        if (!$this->dbforge->create_table($this->intro)) {
            return false;
        }

        return true;
    }

    public function uninstall() {
        $this->dbforge->drop_table('contact_us');
        $this->dbforge->drop_table('contact_us_emails');
        $this->dbforge->drop_table('contact_us_emails_area');
        $this->dbforge->drop_table($this->chilTable);
        $this->dbforge->drop_table($this->mainTable);
        $this->dbforge->drop_table($this->imageTable);
        $this->dbforge->drop_table($this->relationship);
        $this->dbforge->drop_table($this->intro);
        @rmdir($this->upload_path . $this->mainTable);
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Módulo destinado administrar la información de contacto, google maps con arbol de categorias";
    }

}
