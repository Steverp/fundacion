<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Preguntas Frecuentes</h4>
    <a href="<?php echo site_url(); ?>admin/faqs/index/es"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'es' ? 'es_img.png' : 'es_img_gris.png') ?>" width="50" height="40"/> </a>
    <a href="<?php echo site_url(); ?>admin/faqs/index/en"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'en' ? 'en_img.png' : 'en_img_gris.png') ?>" width="50" height="40"/> </a>
</section>

<section class="item">
    <div class="content">

        <fieldset id="filters" class="two">
            <legend>Filtros</legend>
            <?php echo form_open_multipart(site_url('admin/faqs/index/' . $lang_admin), ''); ?>
            <ul>
                <li>
                    <?php echo form_input('shearch', set_value('shearch'), 'style="width:80%" maxlength="100" placeholder="Buscar Pregunta Frecuente"'); ?>
                </li>
                <li>
                    <button type="submit" class="btn btn-default" style="margin-top: 5px" value="Buscar">Buscar</button>
                </li>
            </ul>
            <?php echo form_close(); ?>
        </fieldset>

        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-faqs"><span>Listado de Preguntas Frecuentes</span></a></li>
                <li><a href="#page-structure-categories"><span>Estructura Categorias</span></a></li>
                <li><a href="#page-intro"><span>Introducción</span></a></li>
            </ul>

            <!-- faqOS -->
            <div class="form_inputs" id="page-faqs">
                <fieldset>
                    <?php
                    echo anchor('admin/faqs/create/' . $lang_admin, '<span>+ Nueva Pregunta</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/faqs/index/' . $lang_admin, '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/faqs/index/' . $lang_admin . '/1/1', '<span>Ordenar Preguntas Frecuentes</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($faqs)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="table-list sort" cellspacing="0">
                            <thead>
                                <tr>
                                    <?php if ($ordering): ?>
                                        <th style="width: 5%"></th>
                                    <?php endif; ?>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 40%">Descripcion</th>
                                    <th style="width: 15%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody class="sortable_faqs">
                                <?php foreach ($faqs as $faq): ?>
                                    <tr id="<?php echo $faq->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td><?php echo $faq->name ?></td>
                                        <td><?php echo substr(strip_tags($faq->description), 0, 100); ?>...</td>
                                        <td>
                                            <?php echo anchor('admin/faqs/edit/' . $faq->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/faqs/destroy/' . $faq->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay Registros actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- ESTRUCTURA CATEGORIAS -->
            <div class="form_inputs" id="page-structure-categories">
                <fieldset>
                    <?php echo anchor('admin/faqs/create_category/' . $lang_admin, '<span>+ Nueva Categoria</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <div id="ajax_message"></div>
                    <section class="item">
                        <div class="content">
                            <div id="page-list">
                                <?php echo $structure_categories; ?>
                            </div>
                        </div>
                    </section>

                </fieldset>
            </div>

            <!-- INTRO -->
            <div class="form_inputs" id="page-intro">
                <?php echo form_open_multipart(site_url('admin/faqs/update_intro/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="name">Introducción <span>*</span><small>Evite pegar texto directamente desde un sitio web u otro editor de texto.</small></label>
                            <div class="input">
                                <div class="sroll-table">
                                    <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $intro->text, 'rows' => 30, 'class' => 'wysiwyg-advanced')) ?>
                                    <input type="hidden" name="content" id="text">
                                </div>
                            </div>
                            <br class="clear">
                        </li>
                    </ul>
                </fieldset>

                <div class="buttons float-right padding-top">
                    <?php echo form_hidden('id', $intro->id); ?>
                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                </div>

                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>