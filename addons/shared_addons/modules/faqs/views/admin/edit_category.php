<section class="title">
    <h4>Preguntas Frecuentes / Categorias</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-category"><span>Editar Categoria</span></a></li>
            </ul>
            <div class="form_inputs" id="page-category">
                <?php echo form_open_multipart(site_url('admin/faqs/update_category/' . $lang_admin), ''); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo <span>*</span></label>
                                <div class="input"><?php echo form_input('title', $category->title, 'class="dev-input-title"'); ?></div>
                            </li>
                            <input type="hidden" value="0" name="parent">
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $category->id); ?>
                        <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
                        <a href="<?php echo site_url('admin/faqs/index/' . $lang_admin . '#page-categories') ?>" class="btn red cancel">Cancelar</a>
                        <?php echo anchor('admin/faqs/destroy_category/' . $category->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'confirm btn red')); ?>
                    </div>

                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>