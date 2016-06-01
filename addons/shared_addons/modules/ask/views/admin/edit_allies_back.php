<section class="item">
    <div class="content">
        <h2>Consultores</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-banner"><span><?php echo $titulo; ?></span></a></li>
            </ul>
            <div class="form_inputs" id="page-banner">
                <?php echo form_open_multipart(site_url('admin/ask/edit_allies/' . (isset($dataForm) ? $dataForm->id : '0') . '/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
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
                                    <?php if (!empty($dataForm->image)): ?>
                                        <div>
                                            <img src="<?php echo site_url($dataForm->image) ?>" width="298">
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
                                <label for="name">Nombre</label>
                                <div class="input"><?php echo form_input('name', (isset($dataForm->name)) ? $dataForm->name : set_value('name'), 'class="dev-input-title"'); ?></div>
                            </li>
                            
                            <li>
                                <label for="name">Texto</label>
                                <div class="input">
                                    <textarea name="text" class="wysiwyg-advanced"><?php echo (isset($dataForm->text)) ? $dataForm->text : set_value('text') ?></textarea>
                                </div>
                            </li>
                        </ul>
                        <?php
                        echo (isset($dataForm)) ? form_hidden('id', $dataForm->id) : null;
                        $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                        ?>
                    </fieldset>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>