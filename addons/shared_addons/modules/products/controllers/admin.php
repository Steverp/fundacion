<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author Brayan Acebo
 */
// Ajustamos Zona Horaria
date_default_timezone_set("America/Bogota");

class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $this->lang->load('products');
        $this->template
                ->append_js('module::developer.js')
                ->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $models = array(
            "product_model",
        );
        $this->load->model($models);
    }

    // -----------------------------------------------------------------

    public function index($lang_admin = 'es', $pag = 1, $ordering = 0) {
        $ordering = (empty($ordering) ? FALSE : TRUE);
        // Paginación de Productos
        $count_all = $this->db->select('COUNT(*) AS numreg')
                        ->from('products')
                        ->where('lang', $lang_admin)
                        ->get()->row()->numreg;
        $pagination = create_pagination('admin/products/index/' . $lang_admin, $count_all, (empty($ordering) ? 10 : 100000000), 4);
        $search = '';

        // consulta de los productos a sus respectivas tablas
        $this->db->select('pr.*')
                ->from('products AS pr')
                ->order_by('position', 'ASC')
                ->where('lang', $lang_admin);

        // si se esta buscando
        if (isset($_POST['shearch'])) {
            // Se consultan los productos
            $search = $_POST['shearch'];
            $search = explode(' ', $search);
            if (!empty($search) && count($search) > 1) {
                $first = FALSE;
                foreach ($search AS $item) {
                    if ($first) {
                        $this->db->like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                        $first = TRUE;
                    } else {
                        $this->db->or_like('pr.name', $item);
                        $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $item);
                    }
                }
            } else {
                $this->db->like('pr.name', $_POST['shearch']);
                $this->db->or_like("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(pr.name),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u')", $_POST['shearch']);
            }
        } else {
            if (!$ordering) {
                $this->db->limit($pagination['limit'], $pagination['offset']);
            }
        }

        // traemos los datos
        $products = $this->db->get()->result();

        if (!empty($products)) {
            foreach ($products AS $item) {
                $item->price = (!empty($item->price)) ? "$" . number_format($item->price) : null;
                if (empty($item->image)) {
                    $image_excel = $this->db->where('id', $item->image_excel)->get('files')->row()->filename;
                }
                $item->image = (!empty($item->image) ? $item->image : 'uploads/default/files/' . $image_excel);
            }
        }

        // Intro
        $intro = $this->db->where('lang', $lang_admin)->get('products_intro')->result();
        $intro = $intro[0];

        // categorias con sortable (se consultan con un orden)
        $structure_categories = $this->db
                        ->where('lang', $lang_admin)
                        ->order_by('position', 'ASC')
                        ->get('product_categories')->result();

        // se contruye el html de las categorias
        $structure_categories = $this->product_model->build_categories($structure_categories, 'products', 0, true, null, $lang_admin);

        $this->template
                ->append_js('module::admin/ajax.js')
                ->set('pagination', $pagination)
                ->set('products', $products)
                ->set('intro', $intro)
                ->set('ordering', $ordering)
                ->set('structure_categories', $structure_categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/index');
    }

    // destacados de los productos para el home
    public function outstanding_product($idItem = null, $lang_admin = 'es') {
        // buscamos la cantidad de productos q existen destacados
        $amount = $this->db->where('lang', $lang_admin)->where('outstanding', 1)->get('products')->result();
        $amount = count($amount);

        // buscamos si el registro seleccionado es destacado o no
        $obj = $this->db->where('id', $idItem)->get('products')->row();
        $data['outstanding'] = ($obj->outstanding == 1 ? 0 : 1);

        // si existen menos de la cantidad o se va a quitar un destacado
        if ($amount < 3 || $data['outstanding'] == 0) {
            // actualizamos el registro
            if ($this->db->where('id', $idItem)->update('products', $data)) {
                $statusJson = '';
                $msgJson = 'El producto ahora es destacado.';
            } else {
                $statusJson = 'error';
                $msgJson = 'Ocurrio un error al cambiar el estado a destacado';
            }
        } else {
            $statusJson = 'error';
            $msgJson = 'Ya llegaste al numero limite de destacados';
        }
        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }

    public function orden_categories() {
        // inicializamos las variables
        $statusJson = '';
        $msgJson = '';
        $datosArray = $_POST['subCatArray'];  // tomamos los datos del post y se los damos al data

        $datosArray = array_unique($datosArray);  // quitamos los repetidos
        $datosArray = array_values($datosArray);  // ordenamos el array de 0 a n
        // ponemos el orden de las categorias
        $i = 1;
        foreach ($datosArray as $fila => $idRegistro) {
            $data = array(
                'position' => $i,
            );
            // actualizamos el registro
            if ($this->db->where('id', $idRegistro)->update('product_categories', $data)) {
                if ($statusJson != "error") {
                    $statusJson = "";
                    $msgJson = "El campo se ha cambiado con éxito.";
                }
            } else {
                $statusJson = "error";
                $msgJson = "Ocurrió un error. Actualizando las posiciones";
            }
            $i++;
        }

        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }

    public function orden_products() {
        // inicializamos las variables
        $statusJson = '';
        $msgJson = '';
        $datosArray = $_POST['subCatArray'];  // tomamos los datos del post y se los damos al data

        $datosArray = array_unique($datosArray);  // quitamos los repetidos
        $datosArray = array_values($datosArray);  // ordenamos el array de 0 a n
        // ponemos el orden de las categorias
        $i = 1;
        foreach ($datosArray as $fila => $idRegistro) {
            $data = array(
                'position' => $i,
            );
            // actualizamos el registro
            if ($this->db->where('id', $idRegistro)->update('products', $data)) {
                if ($statusJson != "error") {
                    $statusJson = "";
                    $msgJson = "El campo se ha cambiado con éxito.";
                }
            } else {
                $statusJson = "error";
                $msgJson = "Ocurrió un error. Actualizando las posiciones";
            }
            $i++;
        }

        echo json_encode(array('status' => $statusJson, 'msg' => $msgJson));
    }

    /*
     * Categorias
     */

    public function create_category($lang_admin = 'es') {
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('product_categories')->result();
        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create_category');
    }

    // -----------------------------------------------------------------

    public function store_category($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        // si la validación es correcta
        if ($this->form_validation->run() === TRUE) {

            // guardamos los datos del post
            $post = (object) $this->input->post();

            // organizamos los datos para el insert
            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin
            );

            // insertamos el registro
            if ($this->db->insert('product_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/products/create_category/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/create_category/' . $lang_admin);
        }
    }

    public function destroy_category($id = null, $lang_admin = 'es') {
        // si el id no existe, lo mandamos la pág principal de categorias
        $id or redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');

        // verificamos que la categoria no tenga productos
        $itemsProd = $this->db
                        ->select('COUNT(*) AS numreg')
                        ->from('products')
                        ->where('category', $id)
                        ->get()->result();
        if ($itemsProd[0]->numreg > 0) {
            $this->session->set_flashdata('error', 'La categoria no puede ser eliminada por que tiene productos asignados');
            redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');
        }
        // borramos el registro
        if ($this->db->where('id', $id)->delete('product_categories')) {
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');
    }

    public function edit_category($id = null, $lang_admin = 'es') {
        // buscamos la categoria
        $category = $this->db->where('id', $id)->get('product_categories')->row();
        // buscamos los datos de las categorias para el select
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('product_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('category', $category)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit_category');
    }

    public function update_category($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('title', 'Titulo', 'required|trim');
        $this->form_validation->set_rules('parent', 'Padre', '');

        if ($this->form_validation->run() === TRUE) {
            // guardamos los datos del post
            $post = (object) $this->input->post();

            // organizamos los datos de la actualización
            $data = array(
                'title' => $post->title,
                'slug' => slug($post->title),
                'parent' => $post->parent,
                'lang' => $lang_admin,
            );

            // actualizamos el registro
            if ($this->db->where('id', $post->id)->update('product_categories', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/products/edit_category/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/index/' . $lang_admin . '/#page-structure-categories');
        }
    }

    /*
     * Productos
     */

    public function create($lang_admin = 'es') {
        // cargamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('product_categories')->result();

        $this->template
                ->set('categories', $categories)
                ->set('lang_admin', $lang_admin)
                ->build('admin/create');
    }

    // -----------------------------------------------------------------

    public function store($lang_admin = 'es') {

        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('category', 'Categoria', 'required');
        $this->form_validation->set_rules('content', 'Descripción', 'required|trim');
        $this->form_validation->set_rules('introduction', 'Introducción', 'required|trim');


        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'introduction' => $post->introduction,
                'created_at' => date('Y-m-d H:i:s'),
                'lang' => $lang_admin,
                'category' => $post->category
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/products';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'products/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/products/');
                }
            }

            // Se inserta en la base de datos
            if ($this->db->insert('products', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
            }
            redirect('admin/products/index/' . $lang_admin . '/');
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/create/' . $lang_admin);
        }
    }

    // -----------------------------------------------------------------

    public function destroy($id = null, $lang_admin = 'es') {
        // si el id no existe se devuelve a el index
        $id or redirect('admin/products');
        // buscamos el registro
        $obj = $this->db->where('id', $id)->get($this->db->dbprefix . 'products')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('products')) {
            // borramos la imagen
            @unlink($obj->image);
            // borramos las categorias
            $this->db->delete($this->db->dbprefix . 'products_categories', array('product_id' => $id)); // Eliminaos relación pro cat
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/products/index/' . $lang_admin);
    }

    // --------------------------------------------------------------------------------------

    public function edit($id = null, $lang_admin = 'es') {
        // si no existe el id lo mandamos al index
        $id or redirect('admin/products');
        // buscamos los datos del registro
        $product = $this->db->where('id', $id)->get('products')->row();
        // buscamos las categorias
        $categories = $this->db->where('lang', $lang_admin)->order_by('id', 'ASC')->get('product_categories')->result();

        if (empty($product->image)) {
            $image_excel = $this->db->where('id', $product->image_excel)->get('files')->row()->filename;
            $product->image = 'uploads/default/files/' . $image_excel;
        }

        // organizamos los datos de las categorias del registro
        $return = $this->db->where('product_id', $id)->get('products_categories')->result();
        $selected_category = array();

        foreach ($return as $item) {
            $selected_category[] = $item->category_id;
        }

        $this->template
                ->set('categories', $categories)
                ->set('selected_category', $selected_category)
                ->set('product', $product)
                ->set('lang_admin', $lang_admin)
                ->build('admin/edit');
    }

    // -----------------------------------------------------------------

    public function update($lang_admin = 'es') {
        // Validaciones del Formulario
        $this->form_validation->set_rules('name', 'Nombre', 'required|trim');
        $this->form_validation->set_rules('category', 'Categorias', 'required');
        $this->form_validation->set_rules('content', 'Descripción', 'required|trim');
        $this->form_validation->set_rules('introduction', 'Introducción', 'required|trim');
        $this->form_validation->set_rules('price', 'Precio', 'integer');

        // Se ejecuta la validación
        if ($this->form_validation->run() === TRUE) {
            $post = (object) $this->input->post();

            // Array que se insertara en la base de datos
            $data = array(
                'name' => $post->name,
                'slug' => slug($post->name),
                'description' => html_entity_decode($post->content),
                'introduction' => $post->introduction,
                'price' => ($post->price) ? $post->price : null,
                'category' => $post->category,
                'lang' => $lang_admin,
            );

            // Se carga la imagen
            $config['upload_path'] = './' . UPLOAD_PATH . '/products';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $config['max_size'] = 2050;
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);

            // imagen uno
            $img = $_FILES['image']['name'];

            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'products/' . $datos['upload_data']['file_name'];
                    $img = array('image' => $path);
                    $data = array_merge($data, $img);
                    $obj = $this->db->where('id', $post->id)->get('products')->row();
                    @unlink($obj->image);
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/products/index/' . $lang_admin);
                }
            }

            // Se inserta en la base de datos
            if ($this->db->where('id', $post->id)->update('products', $data)) {
                // borramos los datos de las categorias
                $this->db->delete($this->db->dbprefix . 'products_categories', array('product_id' => $post->id)); // Eliminaos relación pro cat

                $categories = $post->categories;

                // Se relacionan las categorias posteriormente a la inserción
                for ($i = 0; $i < count($categories); $i++) {
                    $data = array(
                        'product_id' => $post->id,
                        'category_id' => $categories[$i]
                    );
                    $this->db->insert($this->db->dbprefix . 'products_categories', $data);
                }

                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/products/index/' . $lang_admin);
            } else {
                $this->session->set_flashdata('error', lang('galeria:error_message'));
                redirect('admin/products/edit/' . $post->id . '/' . $lang_admin);
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/index/' . $lang_admin);
        }
    }

    /*
     * Actualizar Intro
     */

    public function update_intro($lang_admin = 'es') {
        // reglas de validación
        $this->form_validation->set_rules('content', 'Texto', 'trim');
        if ($this->form_validation->run() === TRUE) {
            // guardamos los datos del post
            $post = (object) $this->input->post();
            // organizamos los datos para la actualización
            $data = array(
                'text' => html_entity_decode($post->content)
            );
            // actualizamos los registros
            if ($this->db->where('lang', $lang_admin)->where('id', $post->id)->update('products_intro', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            } else {
                $this->session->set_flashdata('error', lang('gallery:error_message'));
            }
        } else {
            $this->session->set_flashdata('error', validation_errors());
        }
        redirect('admin/products/index/' . $lang_admin . '/#page-intro');
    }

    /*
     * Administración de imagenes
     */

    public function images($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products');
        // Se consultan las imagenes del product
        $images = $this->db->where('product_id', $id)->get('product_images')->result();
        // se consultan los datos del producto
        $product = $this->db->where('id', $id)->get('products')->row();

        $this->template
                ->set('product', $product)
                ->set('images', $images)
                ->build('admin/images');
    }

    public function create_image($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products');
        // se consultan los datos del producto
        $product = $this->db->where('id', $id)->get('products')->row();

        $this->template
                ->set('product', $product)
                ->build('admin/create_image');
    }

    // -----------------------------------------------------------------

    public function store_image() {
        // Se carga la imagen
        $config['upload_path'] = './' . UPLOAD_PATH . '/products';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;

        $this->load->library('upload', $config);

        // se guarda el id del registro
        $id = $this->input->post('id');

        // se guarda el registro dependiendo del tipo
        if (isset($_POST['video'])) {
            $post = (object) $this->input->post();
            $image = array(
                'video' => $post->video,
                'product_id' => $id,
            );
        } else {
            // imagen
            $img = $_FILES['image']['name'];
            $image = array();

            // se guarda la imagen
            if (!empty($img)) {
                if ($this->upload->do_upload('image')) {
                    $datos = array('upload_data' => $this->upload->data());
                    $path = UPLOAD_PATH . 'products/' . $datos['upload_data']['file_name'];
                    $image = array(
                        'product_id' => $id,
                        'path' => $path
                    );
                } else {
                    $this->session->set_flashdata('error', $this->upload->display_errors());
                    redirect('admin/products/images/' . $id);
                }
            }
        }

        // Se inserta en la base de datos
        if ($this->db->insert('product_images', $image)) {
            $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
            redirect('admin/products/images/' . $id);
        } else {
            $this->session->set_flashdata('error', lang('galeria:error_message'));
            redirect('admin/products/create_image/' . $id);
        }
    }

    public function edit_image($idimage = null, $idpro = null) {
        // colocamos el titulo
        $titulo = 'Editar';
        // cargamos los datos
        $modimg = $this->db->where('id', $idimage)->get('product_images')->row();
        $product = $this->db->where('id', $idpro)->get('products')->row();
        // mandamos los datos al template
        $this->template
                ->set('modimg', $modimg)
                ->set('product', $product)
                ->set('titulo', $titulo)
                ->set('idpro', $idpro)
                ->build('admin/edit_image');
    }

    public function update_image($idItem = null, $idpro = null) {

        unset($_POST['btnAction']); // borramos el dato del boton submit
        // configuracion de la libreria upload
        $config['upload_path'] = './' . UPLOAD_PATH . '/products';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;
        // cargamos la libreria upload
        $this->load->library('upload', $config);

        // imagen uno
        $img = $_FILES['image']['name'];

        // si la imagen no esta vacía la guardamos, y la guardamos en el array data
        if (!empty($img)) {
            if ($this->upload->do_upload('image')) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'products/' . $datos['upload_data']['file_name'];
                $data = array('path' => $path);
                $obj = $this->db->where('id', $idItem)->get('product_images')->row();
                @unlink($obj->path);
            } else {
                $this->session->set_flashdata('error', $this->upload->display_errors());
                redirect('admin/products/images/' . $idpro);
            }
        }
        // actualizamos los datos
        if ($this->db->where('id', $idItem)->update('product_images', $data)) {
            $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
            redirect('admin/products/images/' . $idpro);
        } else {
            $this->session->set_flashdata('success', lang('home:error_message'));
            redirect('admin/products/images/' . $idpro);
        }
    }

    // -----------------------------------------------------------------

    public function destroy_image($id = null, $product_id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products');
        // si no existe el id del producto se devuelve al index
        $product_id or redirect('admin/products');
        // consiltamos el registro
        $obj = $this->db->where('id', $id)->get('product_images')->row();
        // borramos el registro
        if ($this->db->where('id', $id)->delete('product_images')) {
            // borramos el archivo
            @unlink($obj->path);
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/products/images/' . $product_id);
    }

    public function features($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products');
        // Se consultan las imagenes del product
        $features = $this->db->where('id_pro', $id)->get('features')->result();
        foreach($features as $feat)
        {
            if($feat->kind==1)
            {
                $feat->type= "Caracteristica";
            }
            else{
                $feat->type= "Beneficio";
            }
        }
        // se consultan los datos del producto
        $product = $this->db->where('id', $id)->get('products')->row();

        $this->template
                ->set('product', $product)
                ->set('features', $features)
                ->build('admin/features');
    }

    public function create_feature($id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products');
        // se consultan los datos del producto
        $product = $this->db->where('id', $id)->get('products')->row();

        $this->template
                ->set('product', $product)
                ->build('admin/create_feature');
    }

    // -----------------------------------------------------------------

    public function store_feature($id = null) {
        // Se carga la imagen
        $this->form_validation->set_rules('text', 'Caracteristica', 'required|trim');
        $this->form_validation->set_rules('kind', 'Tipo', 'required|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/features/' . $id);
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            
            $data = $_POST; // guardamos los datos del post
           
            // insertamos en la base de datos
            if ($this->db->insert('features', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/products/features/' . $id);
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                redirect('admin/products/features/' . $id);
            }
        }
    }

    public function edit_feature($idimage = null, $idpro = null) {
        // colocamos el titulo
        $titulo = 'Editar';
        // cargamos los datos
        $modimg = $this->db->where('id', $idimage)->get('features')->row();
        $product = $this->db->where('id', $idpro)->get('products')->row();
        // mandamos los datos al template
        $this->template
                ->set('modimg', $modimg)
                ->set('product', $product)
                ->set('titulo', $titulo)
                ->set('idpro', $idpro)
                ->build('admin/edit_feature');
    }

    public function update_feature($idItem = null, $idpro = null) {

        $this->form_validation->set_rules('text', 'Caracteristica', 'required|trim');
        $this->form_validation->set_rules('kind', 'Tipo', 'required|trim');

        if ($this->form_validation->run() !== TRUE) {  // abrimos el formulario de edicion
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/products/features/' . $idpro);
        } else { // si el formulario ha sido enviado con éxito se procede
            unset($_POST['btnAction']); // borramos el dato del boton submit
            $_POST['lang'] = $lang_admin; // guardamos el valor del idioma
            $data = $_POST; // guardamos los datos del post
           
            // insertamos en la base de datos
            if ($this->db->where("id", $idItem)->update('features', $data)) {
                $this->session->set_flashdata('success', 'Los registros se ingresaron con éxito.');
                redirect('admin/products/features/' . $idpro);
            } else {
                $this->session->set_flashdata('success', lang('home:error_message'));
                redirect('admin/products/features/' . $idpro);
            }
        }
    }
    
    public function destroy_feature($id = null, $product_id = null) {
        // si no existe el id lo devolvemos al index
        $id or redirect('admin/products/features/' . $product_id);
        // si no existe el id del producto se devuelve al index
        $product_id or redirect('admin/products/features/' . $product_id);
        // borramos el registro
        if ($this->db->where('id', $id)->delete('features')) {
           
            $this->session->set_flashdata('success', 'El registro se elimino con éxito.');
        } else {
            $this->session->set_flashdata('error', 'No se logro eliminar el registro, inténtelo nuevamente');
        }
        redirect('admin/products/features/' . $product_id);
    }

    public function import_products() {
        $this->template->build('admin/import');
    }

    public function read_excel_products() {
        setlocale(LC_ALL, "es");
        date_default_timezone_set('America/Bogota');
        $hoy = date("Y-m-d H:i:s");
        $categories = array();
        $i = 0;
        $posicion = $this->db
                        ->order_by('position', 'desc')
                        ->get('products')
                        ->row()->position;

        // Se carga la imagen
        $config['upload_path'] = './' . UPLOAD_PATH . '/products';
        $config['allowed_types'] = '*';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;

        $this->load->library('upload', $config);

        /* Cargamos el archivo excel que vamos a usar */
        $file = $_FILES['file']['name'];

        $file_path = '';

        if (!empty($file)) {
            if ($this->upload->do_upload('file')) {
                $datos = array('upload_data' => $this->upload->data());
                $file_path = UPLOAD_PATH . 'products/' . $datos['upload_data']['file_name'];

                // Load the spreadsheet reader library
                $this->load->library('excel_reader');
                // Read the spreadsheet via a relative path to the document
                // for example $this->excel_reader->read('./uploads/file.xls');
                $this->excel_reader->read($file_path);
                // Get the contents of the first worksheet
                $worksheet = $this->excel_reader->sheets[0];

                $numRows = $worksheet['numRows']; // ex: 14
                $numCols = $worksheet['numCols']; // ex: 4
                $cells = $worksheet['cells']; // the 1st row are usually the field's name
                // borramos del array los titulos
                if (!empty($cells)) {
                    unset($cells[1]); // la fila de los titulos no existe
                    foreach ($cells AS $cell) {
                        if ($i <= 0) {
                            $posicion += 1;
                        }
                        // guardamos los datos en una array segun el archivo excel
                        $insert = array();
                        $insert['name'] = utf8_encode($cell[1]);
                        $insert['reference'] = utf8_encode($cell[2]);
                        $insert['slug'] = slug($cell[1]);
                        $insert['introduction'] = html_entity_decode(utf8_encode($cell[4]));
                        $insert['description'] = html_entity_decode(utf8_encode($cell[5]));
                        $insert['image_excel'] = $cell[6];
                        $insert['price'] = $cell[7];
                        $insert['position'] = $posicion;
                        $insert['lang'] = $cell[8];
//                        $insert['text'] = preg_replace('/[^a-zA-Z0-9_ %\[\]\.\(\)%&-]/s', '', html_entity_decode($cell[4], ENT_COMPAT, 'UTF-8'));
                        // colocamos los datos por defecto

                        $insert['created_at'] = $hoy;
                        // buscamos el id de la imagen
                        if (!empty($cell[6])) {
                            // dado que las imagenes las suben por los archivos del pyro a la carpeta de products_main_images
                            // consultamos el nombre de los archivos para traer el id
                            $main_image = $this->db->select('id')
                                            ->from('files')
                                            ->where('LOWER(name)', strtolower($cell[6])) // colocamos tanto en sql como en php las minusculas para que la busqueda sea mejor
                                            ->where('folder_id', '2') // el id de la carpeta a la cual guardamos las imagenes
                                            ->get()->result();

                            if (!empty($main_image)) {
                                $main_image = $main_image[0];
                                if (!empty($main_image->id)) {
                                    $insert['image_excel'] = $main_image->id;
                                }
                            }
                        }
                        $fracciones = explode(',', $cell[3]);
                        if (count($fracciones) > 1) {
                            for ($i = 0; $i < count($fracciones); $i++) {
                                $categories[] = $fracciones[$i];
                            }
                        } else {
                            $categories = array(
                                $cell[3]
                            );
                        }
                        // actualizamos el producto y mandamos un mensaje por si alguno presenta un error al actualizar
                        if ($this->db->insert('products', $insert)) {
                            $productId = $this->db->insert_id(); // id del producto
                            for ($i = 0; $i < count($categories); $i++) {
                                $data = array(
                                    'product_id' => $productId,
                                    'category_id' => $categories[$i]
                                );
                                $this->db->insert($this->db->dbprefix . 'products_categories', $data);
                            }
                            $error = false;
                            $this->session->set_flashdata('success', 'Productos importados con éxito');
                        } else {
                            $error = true;
                        }
                        if ($error) {
                            $this->session->set_flashdata('error', 'Ocurrio un error al crear algunos productos');
                        }
                        $posicion++;
                        $i++;
                    }
                    // Clear cache
                    Events::trigger('clear_cache');
                } else {
                    $this->session->set_flashdata('error', 'Error al leer el excel');
                }

                // borramos el archivo
                unlink($file_path);
            } else {
                $this->session->set_flashdata('error', $this->upload->display_errors());
            }
        }
        redirect('admin/products/import_products');
    }

    public function export_categories($status = 1) {
        $this->load->library(array('to_excel'));
        $headers = array();
        $namefile = "Categorias";
        $datosSql = $this->db
                ->select('ce.id AS Id, ce.title AS Titulo, ce.parent AS IdsAsociados, ce.lang AS Lenguage')
                ->from('product_categories AS ce')
                ->get();

        $i = 0;

        foreach ($datosSql->result_array() as $row => $value) {
            $i = 0;
            foreach ($value as $row2 => $value2) {
                array_push($headers, $row2);
                $i++;
            }
            break;
        }
        $arrayExcel = $datosSql->result();
        array_unshift($arrayExcel, $headers);
        $this->to_excel($datosSql, $namefile);
    }

    // pasar un query sql de codeigniter a excel
    function to_excel($datosSql, $filename = 'exceloutput') {
        $encabezadoExcel = '';  // just creating the var for field headers to append to below
        $datosExcel = '';  // just creating the var for field data to append to below	     

        $obj = & get_instance();

        if ($datosSql->num_rows() == 0) {
            echo '<p>La tabla no tiene datos.</p>';
        } else {
            foreach ($datosSql->result_array() as $row => $value) {
                $encabezadoExcel = '';
                foreach ($value as $row2 => $value2) {
                    $encabezadoExcel .= $row2 . "\t";
                }
            }

            foreach ($datosSql->result() as $row) {
                $lineaExcel = '';
                foreach ($row as $value) {
                    if ((!isset($value)) OR ( $value == "")) {
                        $value = "\t";
                    } else {
                        $value = str_replace('"', '""', $value);
                        $value = '"' . $value . '"' . "\t";
                    }
                    $lineaExcel .= $value;
                }
                $datosExcel .= trim($lineaExcel) . "\n";
            }

            $datosExcel = str_replace("\r", "", $datosExcel);

            // pasar los datos de utf-8 a ansi
            $datosExcel = iconv('UTF-8', 'ISO-8859-1', $datosExcel);
            $encabezadoExcel = iconv('UTF-8', 'ISO-8859-1', $encabezadoExcel);
            header("Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");  // for Excel 2007
            header("Content-Disposition: attachment; filename=$filename.xls");
            echo "$encabezadoExcel\n$datosExcel";
        }
    }

}
