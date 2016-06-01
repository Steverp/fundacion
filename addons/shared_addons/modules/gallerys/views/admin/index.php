<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Galería de Imagenes</h4>
</section>

<section class="item">
    <div class="content">

        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-gallerys"><span>Listado de Albumes</span></a></li>
                <li><a href="#page-structure-categories"><span>Estructura Categorias</span></a></li>
                <li><a href="#page-intro"><span>Introducción</span></a></li>
            </ul>

            <!-- gallery -->
            <div class="form_inputs" id="page-gallerys">
                <fieldset id="filters" class="two">
                    <legend>Filtros</legend>
                    <?php echo form_open_multipart(site_url('admin/gallerys/index/' . $lang_admin), ''); ?>
                    <ul>
                        <li>
                            <?php echo form_input('shearch', set_value('shearch'), 'style="width:80%" maxlength="100" placeholder="Buscar imagen"'); ?>
                        </li>
                        <li>
                            <button type="submit" class="btn btn-default" style="margin-top: 5px" value="Buscar">Buscar</button>
                        </li>
                    </ul>
                    <?php echo form_close(); ?>
                </fieldset>
                <fieldset>
                    <?php
                    echo anchor('admin/gallerys/create/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/gallerys/index', '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/gallerys/index/'.$lang_admin.'/1/1', '<span>Ordenar</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($gallerys)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="<?= $ordering ? 'table-list sort' : '' ?>" cellspacing="0">
                            <thead>
                                <tr>
                                    <?php if ($ordering): ?>
                                        <th style="width: 5%"></th>
                                    <?php endif; ?>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 5%">Imagen</th>
                                    <th class="hide" style="width: 5%">Fecha</th>
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
                            <tbody class="<?= $ordering ? 'sortable_gallerys' : '' ?>">
                                <?php foreach ($gallerys as $gallery): ?>
                                    <tr id="<?php echo $gallery->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td><?php echo $gallery->name ?></td>
                                        <td>
                                            <?php if (!empty($gallery->image)): ?>
                                                <img src="<?php echo site_url($gallery->image); ?>" style="height: 40px;width: 40px">
                                            <?php endif; ?>
                                        </td>
                                        <td class="hide"><?php echo $gallery->fecha ?></td>
                                        <td>
                                            <?php echo anchor('admin/gallerys/images/' . $gallery->id, "Imagenes", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/gallerys/edit/' . $gallery->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/gallerys/destroy/' . $gallery->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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
                    <?php echo anchor('admin/gallerys/create_category/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
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
                <?php echo form_open_multipart(site_url('admin/gallerys/update_intro/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="title">Titulo de Sección</label>
                            <div class="input">
                                <textarea name="title" class="wysiwyg-simple"><?php echo $intro->title; ?></textarea>
                            </div>
                        </li>
                        <li class="hide">
                            <label for="name">Imágen
                                <small>
                                    - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    - Tamaño mínimo 500px X 300px<br>
                                </small>
                            </label>
                            <div class="input">
                                <?php if (!empty($intro->image)): ?>
                                    <div>
                                        <img src="<?php echo val_image($intro->image) ?>" width="298">
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
                            <label for="name">Introducción
                                <small>Evite pegar texto directamente desde un sitio web u otro editor de texto.</small>
                            </label>
                            <div class="input">
                                <div class="sroll-table">
                                    <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $intro->text, 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
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