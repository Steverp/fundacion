<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Galeria / <?php echo ucfirst($gallery->name) ?> / Imagenes</h4>
    <a href="<?php echo site_url('admin/gallerys') ?>" class="btn small">Volver </a>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-gallerys"><span>Imagenes</span></a></li>
            </ul>

            <!-- IMAGENES -->
            <div class="form_inputs" id="page-gallerys">
                <fieldset>
                    <?php
                    echo anchor('admin/gallerys/create_image/' . $gallery->id, '<span>Nuevo</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/gallerys/images/' . $gallery->id, '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/gallerys/images/' . $gallery->id . '/1/1', '<span>Ordenar</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($images)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="<?= $ordering ? 'table-list sort' : '' ?>" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Imagen</th>
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 40%">Url imagen</th>
                                    <th style="width: 30%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody class="<?= $ordering ? 'sortable_docs' : '' ?>">
                                <?php foreach ($images as $image): ?>
                                    <tr id="<?php echo $image->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td>
                                            <?php if (!empty($image->path)): ?>
                                                <img src="<?php echo val_image($image->path) ?>" alt="imagen" height="100">
                                            <?php else: ?>
                                                <?php echo $image->video; ?>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $image->title; ?></td>
                                        <td><?php echo base_url($image->path); ?></td>
                                        <td>
                                            <?php echo anchor('admin/gallerys/edit_image/' . $image->id . '/' . $gallery->id, 'Editar', array('class' => 'btn blue small')) ?>
                                            <?php echo anchor('admin/gallerys/destroy_image/' . $image->id . '/' . $gallery->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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

        </div>
    </div>
</section>