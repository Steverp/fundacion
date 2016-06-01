<section class="title">
    <h4>Procesos</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-proces"><span>Nuevo Proceso</span></a></li>
            </ul>
            <?php echo form_open_multipart(site_url('admin/process/store_process'), 'id="form-wysiwyg"'); ?>
            <div class="form_inputs" id="page-proces">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo</label>
                                <div class="input"><?php echo form_input('title', set_value('title'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Código de Proceso</label>
                                <div class="input"><?php echo form_input('cod', set_value('cod'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Estado de proceso</label>
                                <div class="input">
                                    <select name="id_estado">
                                        <option value="">Seleccione</option>
                                        <?php foreach ($estados as $est){?>
                                        <option value="<?php echo $est->id; ?>"><?php echo $est->name; ?></option>
                                        <?php }?>
                                    </select>
                                </div>
                            </li>
                            <li>
                                <label for="title">Descripción</label>
                                <div class="input">
                                    <textarea name="description" class="wysiwyg-advanced"><?php set_value('description'); ?></textarea>
                                </div>
                            </li>
                            <li>
                                <label for="title">Introducción</label>
                                <div class="input">
                                    <textarea name="introduction" class="wysiwyg-advanced"><?php set_value('introduction'); ?></textarea>
                                </div>
                            </li>
                        </ul>
                    </fieldset>
                    <input name="id_user" value="<?php echo $id; ?>" type="hidden">
                    <div class="buttons float-right padding-top">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
            </div>
            <?php echo form_close(); ?>

        </div>
    </div>
</section>