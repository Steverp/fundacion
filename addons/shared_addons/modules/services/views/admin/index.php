<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Servicios</h4>
</section>

<section class="item">
    <div class="content">

        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-services"><span>Listado de servicios</span></a></li>
                <li><a href="#page-intro"><span>Introducción</span></a></li>
            </ul>

            <!-- servicios -->
            <div class="form_inputs" id="page-services">
                <fieldset id="filters" class="two">
                    <legend>Filtros</legend>
                    <?php echo form_open_multipart(site_url('admin/services/index/' . $lang_admin), ''); ?>
                    <ul>
                        <li>
                            <?php echo form_input('shearch', set_value('shearch'), 'style="width:80%" maxlength="100" placeholder="Buscar servicio"'); ?>
                        </li>
                        <li>
                            <button type="submit" class="btn btn-default" style="margin-top: 5px" value="Buscar">Buscar</button>
                        </li>
                    </ul>
                    <?php echo form_close(); ?>
                </fieldset>
                <fieldset>
                    <?php
                    echo anchor('admin/services/create/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/services/index/' . $lang_admin, '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/services/index/' . $lang_admin . '/1/1', '<span>Ordenar</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($services)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="<?= ($ordering)? 'table-list sort': '' ; ?>" cellspacing="0">
                            <thead>
                                <tr>
                                    <?php if ($ordering): ?>
                                        <th style="width: 5%"></th>
                                    <?php endif; ?>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 40%">Introducción</th>
                                    <th style="width: 5%">Imagen</th>
                                    <th style="width: 10%">Destacado</th>
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
                            <tbody class="<?= ($ordering)? 'sortable_services' : '' ; ?>">
                                <?php foreach ($services as $service): ?>
                                    <tr id="<?php echo $service->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td><?php echo $service->name ?></td>
                                        <td><?php echo substr(strip_tags($service->introduction), 0, 100); ?>...</td>
                                        <td>
                                            <?php if (!empty($service->image)) { ?>
                                                <img src="<?php echo site_url($service->image); ?>" style="height: 40px;width: 40px">
                                            <?php } ?>
                                        </td>
                                        <td><a class="outstanding_service" href="admin/services/outstanding_service/<?php echo $service->id . '/' . $lang_admin; ?>"><img src="<?php echo site_url() . 'uploads/default/' . ($service->outstanding == 1 ? 'estrella' : 'estrella_gris') . '.png'; ?>" border="0"></a> </td>
                                        <td>
                                            <?php echo anchor('admin/services/edit/' . $service->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php // echo anchor('admin/services/images/' . $service->id, "Imagenes", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/services/destroy/' . $service->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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

            <!-- INTRO -->
            <div class="form_inputs" id="page-intro">
                <?php echo form_open_multipart(site_url('admin/services/update_intro/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="title">Titulo de Sección </label>
                            <div class="input">
                                <textarea name="title" class="wysiwyg-simple"><?php echo $intro->title; ?></textarea>
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