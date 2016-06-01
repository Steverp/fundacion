<section class="title">
    <h4>Servicios</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-service"><span>Editar</span></a></li>
            </ul>
            <div class="form_inputs" id="page-service">
                <?php echo form_open_multipart(site_url('admin/services/update/' . $lang_admin), 'id="form-wysiwyg"'); ?>
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
                                    <?php if (!empty($service->image)): ?>
                                        <div>
                                            <img src="<?php echo val_image($service->image) ?>" width="298">
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('image', '', ' id="image"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="detail">Ver Brochure
                                </label>
                                <div class="input">
                                    <label class="radio">
                                        <input name="seefile" type="checkbox" <?php echo ($service->seefile == 1)? "checked" : ""; ?>/>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <label for="name">Brochure
                                    <small>
                                        - Formato Permitido pdf<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <?php if (!empty($service->file)): ?>
                                        <div>
                                            <a href="<?php echo val_image($service->file) ?>" target="_blank">Ver Brochure</a>
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('file', '', ' id="file"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title">Nombre</label>
                                <div class="input"><?php echo form_input('name', $service->name, 'class="dev-input-title"'); ?></div>
                            </li>
                            <li class="even">
                                <label for="name">
                                    Descripción
                                    <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>
                                </label>
                                <div class="input">
                                    <div class="sroll-table">
                                        <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $service->description, 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
                                        <input type="hidden" name="content" id="text">
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="introduction">Introducción
                                </label>
                                <div class="input"><?php echo form_textarea('introduction', $service->introduction, 'class="dev-input-textarea" length="100"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $service->id); ?>
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>