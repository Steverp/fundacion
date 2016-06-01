<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Proyectos</h4>
</section>
<section class="item">
    <div class="content">

        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-projects"><span>Listado</span></a></li>
                <li><a href="#page-structure-categories"><span>Categorias</span></a></li>
                <li><a href="#page-intro"><span>Introducción</span></a></li>
            </ul>

            <!-- projectOS -->
            <div class="form_inputs" id="page-projects">
                <fieldset id="filters" class="two">
                    <legend>Filtros</legend>
                    <?php echo form_open_multipart(site_url('admin/projects/index/' . $lang_admin), ''); ?>
                    <ul>
                        <li>
                            <?php echo form_input('shearch', set_value('shearch'), 'style="width:80%" maxlength="100" placeholder="Buscar Proyectos"'); ?>
                        </li>
                        <li>
                            <button type="submit" class="btn btn-default" style="margin-top: 5px" value="Buscar">Buscar</button>
                        </li>
                    </ul>
                    <?php echo form_close(); ?>
                </fieldset>
                <fieldset>
                    <?php
                    echo anchor('admin/projects/create/' . $lang_admin, '<span>Crear</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/projects/index/' . $lang_admin, '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/projects/index/' . $lang_admin . '/1/1', '<span>Ordenar</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($projects)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="table-list sort" cellspacing="0">
                            <thead>
                                <tr>
                                    <?php if ($ordering): ?>
                                        <th style="width: 5%"></th>
                                    <?php endif; ?>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 40%">Introducción</th>
                                    <th style="width: 5%">Imagen</th>
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
                            <tbody class="sortable_projects">
                                <?php foreach ($projects as $project): ?>
                                    <tr id="<?php echo $project->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td><?php echo $project->name ?></td>
                                        <td><?php echo substr(strip_tags($project->introduction), 0, 100); ?>...</td>
                                        <td>
                                            <?php if (!empty($project->image)): ?>
                                                <img src="<?php echo site_url($project->image); ?>" style="height: 40px;width: 40px">
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php echo anchor('admin/projects/edit/' . $project->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/projects/destroy/' . $project->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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
                    <?php echo anchor('admin/projects/create_category/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
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
                <?php echo form_open_multipart(site_url('admin/projects/update_intro/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="title">Titulo de sección</label>
                            <div class="input">
                                <textarea name="title" class="wysiwyg-simple"><?php echo $intro->title;?></textarea>
                            </div>
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