<section class="title">
    <h4>Preguntanos</h4>
    <a href="<?php echo site_url(); ?>admin/ask/index/es"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'es' ? 'es_img.png' : 'es_img_gris.png') ?>" width="50" height="40"/> </a>
    <a href="<?php echo site_url(); ?>admin/ask/index/en"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'en' ? 'en_img.png' : 'en_img_gris.png') ?>" width="50" height="40"/> </a>
    <br>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-view"><span>Contenido</span></a></li>
                <li><a href="#page-allies"><span>Consultores</span></a></li>
            </ul>

            <div class="form_inputs" id="page-view">
                <?php echo form_open_multipart(site_url('admin/ask/index/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">
                                    Texto
                                    <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>
                                </label>
                                <div class="input">
                                    <div class="sroll-table">
                                        <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $data->text, 'rows' => 30, 'class' => 'wysiwyg-advanced')) ?>
                                        <input type="hidden" name="text" id="text">
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title1">Titulo Paso 1</label>
                                <div class="input">
                                    <?php echo form_input('title1', (isset($data->title1)) ? $data->title1 : set_value('title1'), 'class="dev-input-title"'); ?>
                                </div>
                            </li>
                            <li>
                                <label for="text1">Texto Paso 1</label>
                                <div class="input">
                                    <?php echo form_input('text1', (isset($data->text1)) ? $data->text1 : set_value('text1'), 'class="dev-input-title"'); ?>
                                </div>
                            </li>

                            <li>
                                <label for="title2">Titulo Paso 2</label>
                                <div class="input">
                                    <div class="input">
                                        <?php echo form_input('title2', (isset($data->title2)) ? $data->title2 : set_value('title2'), 'class="dev-input-title"'); ?>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <label for="text2">Texto Paso 2</label>
                                <div class="input">
                                    <?php echo form_input('text2', (isset($data->text2)) ? $data->text2 : set_value('text2'), 'class="dev-input-title"'); ?>
                                </div>
                            </li>

                            <li class="even">
                                <label for="name">
                                    Texto de footer
                                </label>
                                <div class="input">
                                    <textarea name="footer" class="wysiwyg-advanced"><?php echo isset($data->footer) ? $data->footer : ""; ?></textarea>
                                </div>
                                <br class="clear">
                            </li>

                            <li>
                                <div class="buttons float-right padding-top">
                                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                                </div>
                            </li>

                        </ul>
                    </fieldset>
                </div>

                <?php echo form_hidden('id', $data->id); ?>
                <?php echo form_close(); ?>
            </div>

            <!-- slider aliados -->
            <div class="form_inputs" id="page-allies">
                <fieldset>
                    <?php echo anchor('admin/ask/edit_allies/0/' . $lang_admin, '<span>Crear</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($allies)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Nombre</th>
                                    <th style="width: 40%">Imagen</th>
                                    <th class="width-10">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php foreach ($allies as $allie): ?>
                                    <tr>
                                        <td>
                                            <?php echo $allie->name; ?>
                                        </td>
                                        <td>
                                            <?php if (!empty($allie->image)): ?>
                                                <img src="<?php echo site_url($allie->image); ?>" style="width: 139px;">
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php echo anchor('admin/ask/edit_allies/' . $allie->id . '/' . $lang_admin, lang('global:edit'), 'class="btn blue small"'); ?>
                                            <?php echo anchor('admin/ask/delete_allies/' . $allie->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay aliados actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

        </div>
    </div>
</section>