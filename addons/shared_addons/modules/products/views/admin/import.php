<section class="title">
    <h4>Importar Productos</h4>
</section>
<section class="item">
    <div class="content">
        <fieldset id="filters" class="four">
            <legend></legend>
            <h4>Pasos para importar los programas:</h4>
            <p>Paso 1: Se deben subir las imagenes de los producto, para esto existe un modulo llamado archivos, que lo encontraras en el menu Contenido->Archivos, en este encontraras una carpeta llamada Productos
                en la cual se deben subir las imagenes en lo posible sin repetir el nombre
            </p>
            <p>Paso 2: Descargar el archivo de <a href="<?= base_url('uploads/default/products/Ejemplo_carga_masiva.xls'); ?>">ejemplo</a></p>
            <p>
                Paso 4: Los campos son los siguientes <br>
                -<b>Titulo:</b> En este campo asigne el titulo del producto.<br>
                -<b>Referencia:</b> Escriba algun codigo que haga referencia a su producto.<br>
                -<b>Categoria:</b> Para las categorias use el id de las categorias descarge una lista de categorias <?php echo anchor('admin/products/export_categories/', '<span>Exportar a Excel</span>', 'class="btn blue small"'); ?> Si desea agregar mas de una categoria a un producto agregre las categorias seguidas por coma Ej: 1,2,3.<br>
                -<b>Introduccion:</b> Asigne una introduccion con un tamaño no mayor a 600 caracteres.<br>
                -<b>Descripcion:</b> Asigne una descripcion para su producto no importa el largo para esta descripcion.<br>
                -<b>Imagen:</b> Para agregar las imagenes vaya a esta seccion <a href="<?= base_url('admin/files#productos/') ?>" target="_blank"> Archivos </a> suba sus imagenes y luego coloque el nombre de la imegen que desea en el excel.<br>
                -<b>Precio:</b> Agregre un precio para su producto.<br>
                -<b>Idioma:</b> Para el idioma seleccione es para español o en para ingles si solo son productos en español no es necesario llenar este campo.<br>
                <br/>
                <br/>
            </p>
            <?php if (!empty($contact)): ?>
                <?php echo anchor('admin/contact_us/export_contact_mail/', '<span>Exportar a Excel</span>', 'class="btn blue small"'); ?>
            <?php endif ?>
            <br/>
            <p>Nota: <br/>
                La estructura del excel no puede ser modificada. <br/>
            </p>
            <br/>
            <br/>
            <br/>
            <ul>
                <li>
                <center>
                    <?php echo form_open_multipart(site_url('admin/products/read_excel_products/'), 'class="crud"'); ?>
                    <fieldset>
                        <ul>

                            <li>
                                <label for="name">Importar Archivo
                                    <small>
                                        - Se importa el Excel en un formato .xls (Libro de excel 97 - 2003)
                                    </small>
                                </label>
                                <div class="btn-false">
                                    <div class="btn">Examinar</div>
                                    <?php echo form_upload('file', set_value('file'), ' id="file"'); ?>
                                </div>
                            </li>
                        </ul>
                        <?php
                        $this->load->view('admin/partials/buttons', array('buttons' => array('save')));
                        ?>
                    </fieldset>
                    <?php echo form_close(); ?>
                </center>
                </li>
            </ul>
        </fieldset>
    </div>
</section>