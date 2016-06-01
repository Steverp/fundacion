<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Procesos de <?php echo $usuario->username; ?></h4>
    <a href="<?php echo site_url('admin/#page-arren') ?>" class="btn small">Volver a Usuarios</a>
</section>

<section class="item">
    <div class="content">
        <div class="tabs">

            <!-- procesOS -->
            <div class="form_inputs" id="page-process">
                <fieldset>
                    <?php echo anchor('admin/process/create_process/' . $usuario->id , '<span>Agregar Proceso</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>

                    <?php if (!empty($docs)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 20%">Introduccion</th>
                                    <th style="width: 10%">Acciones</th>
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
                                <?php foreach ($docs as $doc): ?>
                                    <tr>
                                        <td><?php echo $doc->title ?></td>
                                        <td><?php echo $doc->introduction ?></td>
                                        <td>
                                            <?php echo anchor('admin/process/edit_process/' . $doc->id .'/'. $usuario->id, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/process/docs/' . $doc->id, "Documentos", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/process/destroy_doc/' . $doc->id . '/' . $usuario->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                            <?php echo anchor('admin/process/send_info/' . $usuario->id .'/'. $doc->id, '<span>Informar cambios</span>', 'class="btn blue small"'); ?>
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