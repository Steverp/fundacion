<section class="title">
    <h4>Documentos</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-proces"><span>Editar documento</span></a></li>
            </ul>
            <?php echo form_open_multipart(site_url('admin/process/update_doc/' . $doc->id), 'id="form-wysiwyg"'); ?>

            <div class="form_inputs" id="page-proces">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Documento
                                </label>
                                <div class="input">
                                    <?php if (!empty($doc->file)): ?>
                                        <div>
                                            <a href="<?php echo val_image($doc->file); ?>" target="_blank">Ver documento</a>
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
                                <label for="title">Titulo</label>
                                <div class="input"><?php echo form_input('name', $doc->name, 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $doc->id); ?>
                        <input name="id_user_process" value="<?php echo $idP; ?>" type="hidden">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>