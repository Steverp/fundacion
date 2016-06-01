<section class="item">
    <div class="content">
        <h2>Nuestros Clientes</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-principal"><span><?php echo $titulo; ?></span></a></li>
            </ul>

            <div class="inline-form" id="page-principal">
                <?php echo form_open_multipart(site_url('admin/home/store_people/'. $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="name">Imagen
                                <small>
                                    - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    - Todas las imagenes deben ser del mismo tamaño
                                </small>
                            </label>
                            <div class="btn-false">
                                <div class="btn">Examinar</div>
                                <?php echo form_upload('image', set_value('image'), ' id="image"'); ?>
                            </div>
                        </li>
                        <li>
                            <label for="name">Titulo</label>
                            <div class="input">
                                <?php echo form_input('title', set_value('title'), 'class="dev-input-title" style="width:100%"'); ?>
                            </div>
                        </li>
                        <li>
                            <label for="name">Texto</label>
                            <div class="input">
                                <textarea name="text" class="wysiwyg-simple"></textarea>
                            </div>
                        </li>
                    </ul>
                    <?php
                    $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                    ?>
                </fieldset>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>