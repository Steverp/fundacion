<section class="title">
    <h4>Imagenes</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-gallery"><span>Crear</span></a></li>
            </ul>
            <div class="form_inputs" id="page-gallery">
                <?php echo form_open_multipart(site_url('admin/gallerys/store/'.$lang_admin), 'id="form-wysiwyg"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Imagen
                                    <small>
                                        - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('image', '', ' id="image"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="path">Categorias</label>
                                <select name="categories[]" multiple>
                                    <option value="0">Seleccione una Opción</option>
                                    <?php foreach ($categories as $item): ?>
                                        <option value="<?php echo $item->id; ?>" <?php echo set_select('categories', $item->id); ?>>
                                            <?php echo $item->title; ?>
                                        </option>
                                    <?php endforeach ?>
                                </select>
                            </li>
                            <li>
                                <label for="title">Nombre </label>
                                <div class="input"><?php echo form_input('name', set_value('name'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li class="even">
                                <label for="name">
                                    Descripción
                                    <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>
                                </label>
                                <div class="input">
                                    <div class="sroll-table">
                                        <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'intro', 'value' => set_value('intro'), 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>