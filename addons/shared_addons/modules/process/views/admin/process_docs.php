<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4><?php echo $process->title; ?>: documentos</h4>
    <a href="<?php echo site_url('admin/process/user_process/'.$user) ?>" class="btn small">Volver a Procesos</a>
</section>

<section class="item">
    <div class="content">
        <div class="tabs">

            <!-- procesOS -->
            <div class="form_inputs" id="page-process">
                <fieldset>
                    <?php echo anchor('admin/process/create_doc/' . $process->id, '<span>Agregar Documento</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>

                    <?php if (!empty($docs)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 20%"></th>
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
                                        <td><?php echo $doc->name ?></td>
                                        <td><a href="<?php echo $doc->file; ?>" target="_blank">Ver Documento</a></td>
                                        <td>
                                            <?php echo anchor('admin/process/edit_doc/' . $doc->id .'/'. $process->id, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/process/destroy_doc/' . $doc->id .'/'. $process->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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