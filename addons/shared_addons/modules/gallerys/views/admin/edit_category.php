<section class="title">
    <h4>Galería de Imagenes / Categorias</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-category"><span>Editar</span></a></li>
            </ul>
            <div class="form_inputs" id="page-category">
                <?php echo form_open_multipart(site_url('admin/gallerys/update_category/'.$lang_admin), ''); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo <span>*</span></label>
                                <div class="input"><?php echo form_input('title', $category->title, 'class="dev-input-title"'); ?></div>
                            </li>
                            <li class="hide">
                                <label for="path">Padre</label>
                                <select name="parent">
                                    <option value="0">Seleccione una opción</option>
                                    <?php foreach ($categories as $item): ?>
                                        <?php if($item->id != $category->id): ?>
                                            <option value="<?php echo $item->id; ?>" <?php echo ($item->id == $category->parent) ? "selected" : null ?>>
                                                <?php echo $item->title; ?>
                                            </option>
                                        <?php endif; ?>
                                    <?php endforeach ?>
                                </select>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id',$category->id); ?>
                        <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
                        <a href="<?php echo site_url('admin/gallerys/index/'.$lang_admin.'#page-categories') ?>" class="btn red cancel">Cancelar</a>
                        <?php echo anchor('admin/gallerys/destroy_category/'.$category->id.'/'.$lang_admin, lang('global:delete'), array('class' => 'confirm btn red')); ?>
                    </div>

                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>