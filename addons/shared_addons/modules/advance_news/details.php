<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Module_advance_news extends Module {
    public $version = '1.2';
    public function info() {
        return array(
            'name' => array(
                'en' => 'Advance News',
                'es' => 'Noticias Avanzadas',
            ),
            'description' => array(
                'en' => 'This is a module of advance_news © Brayan Acebo, Luis Salazar',
                'es' => 'Modulo de Noticias © Brayan Acebo, Luis Salazar',
            ),
            'frontend' => TRUE,
            'backend' => TRUE,
            'menu' => 'content',
        );
    }

    public function install() {
		/* Creación de tabla para los comentarios */
        $this->dbforge->drop_table('advance_news_comments');
        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'id_advance_new' =>  array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => true
            ),
            'email' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'name' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'comment' => array(
                'type' => 'TEXT',
                'constraint' => '',
                'null' => true
            ),
        );
        $this->dbforge->add_field($field);
        $this->dbforge->add_key('id', true);
        if (!$this->dbforge->create_table('advance_news_comments')) {
            return false;
        }		
		// Creando tabla para multiples imagenes
        $this->dbforge->drop_table('advance_news_images');

        $field = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'advance_new_id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => false
            ),
            'path' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
			'video' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'created_at' => array(
                'type' => 'TIMESTAMP',
                'constraint' => '',
                'null' => false
            )
        );

        $this->dbforge->add_field($field);
        $this->dbforge->add_key('id', true);

        if (!$this->dbforge->create_table('advance_news_images'))
		{
            return false;
        }
		
		// creamos la tabla de noticias
        $this->dbforge->drop_table('advance_news');
        $advance_news = array(
            'id' => array('type' => 'INT', 'constraint' => '11', 'auto_increment' => TRUE),
            'title' => array('type' => 'VARCHAR', 'constraint' => '100', 'null' => true),
            'slug' => array('type' => 'VARCHAR', 'constraint' => '455', 'null' => true),
			'autor' => array('type' => 'VARCHAR', 'constraint' => '50', 'null' => true),
            'image' => array('type' => 'VARCHAR', 'constraint' => '455', 'null' => true),
            'content' => array('type' => 'TEXT', 'constraint' => '', 'null' => true),
            'introduction' => array('type' => 'VARCHAR', 'constraint' => '600', 'null' => true),
            'date' => array('type' => 'DATETIME', 'constraint' => '', 'null' => true),
            'position' => array('type' => 'INT', 'constraint' => '11', 'null' => true),
			'outstanding' => array('type' => 'INT', 'constraint' => '1', 'null' => true),
			'title_said' => array('type' => 'VARCHAR', 'constraint' => '100', 'null' => true),
			'autor_said' => array('type' => 'VARCHAR', 'constraint' => '50', 'null' => true),
			'video_audio' => array('type' => 'TEXT', 'constraint' => '', 'null' => true),
			'type' => array('type' => 'INT', 'constraint' => '1', 'null' => true),
			'lang' => array('type' => 'VARCHAR', 'constraint' => '2', 'null' => true, 'default' => 'es'),
        );
        $this->dbforge->add_field($advance_news);
        $this->dbforge->add_key('id', TRUE);
        if ($this->dbforge->create_table('advance_news') AND
                is_dir($this->upload_path . 'advance_news') OR @mkdir($this->upload_path . 'advance_news', 0777, TRUE)) {
            return TRUE;
        }
    }
    public function uninstall() {
        //Codigo para la desinstalacion del modulo
        $this->dbforge->drop_table('advance_news');
		$this->dbforge->drop_table('advance_news_images');
		$this->dbforge->drop_table('advance_news_comments');
		@rmdir($this->upload_path.'advance_news');
        return TRUE;
    }
    public function upgrade($old_version) {
        // Su lógica de actualización
        return TRUE;
    }
    public function help() {
        // Retorna un string con información de ayuda
        return "
           <div style='height: 416px;background-image:url(https://lh4.googleusercontent.com/qon9bxaIQSgXlsnRADpd2HGi4CR7CBwc7MqC1d4TCg=w332-h207-p-no);background-size: 100%;'>
                  <div style='margin-left: 464px;font-size: 23px;color: #14D1F5;'>Modulo Sample</div>
                  <div style='width: 310px;font-size: 16px;margin-left: 392px;margin-top: 30px;'>Si tiene alguna sugerencia o inconveniente comuníquese con nuestros asesores</div>
           </div>
        ";
    }
}
/* Fin del archivo details.php */