<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Procesos</h4>
</section>

<section class="item">
    <div class="content">

        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-arren"><span>Usuarios</span></a></li>
                <li><a href="#page-est"><span>Estados de procesos</span></a></li>
            </ul>

            <div class="form_inputs" id="page-arren">
                <?php // echo anchor('admin/users/create/', '<span>Nuevo Usuario</span>', 'class="btn blue"'); ?>
                <br>
                <br>
                <fieldset>
                    <?php if (!empty($clientes)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 80%">Nombre</th>
                                    <th class="width: 20%">Acciones</th>
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
                                <?php foreach ($clientes as $arr): ?>
                                    <tr>
                                        <td><?php echo $arr->username ?></td>
                                        <td>
                                            <a href="admin/process/user_process/<?php echo $arr->id; ?>" class="btn blue small">Ver Procesos</a>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay Correos de Contactanos actualmente</p>
                    <?php endif ?>

                </fieldset>
            </div>
            <!--BANDEJA DE CORREOS DE CONTACTENOS-->
            <div class="form_inputs" id="page-est">
                <fieldset>
                    <?php echo anchor('admin/process/create_est/', '<span>Nuevo Estado</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($estados)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 80%">Nombre</th>
                                    <th class="width: 20%">Acciones</th>
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
                                <?php foreach ($estados as $est): ?>
                                    <tr>
                                        <td><?php echo $est->name ?></td>
                                        <td>
                                            <?php echo anchor('admin/process/edit_est/' . $est->id, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/process/destroy_est/' . $est->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay Correos de Contactanos actualmente</p>
                    <?php endif ?>

                </fieldset>
            </div>

        </div>
    </div>
</section>