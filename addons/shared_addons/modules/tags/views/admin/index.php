<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-tags"><span>Tags</span></a></li>
            </ul>

            <!-- tags -->

            <div class="form_inputs" id="page-tags">
                <fieldset>

                    <?php echo anchor('admin/tags/create', '<span>+ Crear tag</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>

                    <?php if (!empty($tags)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 70%">Titulo</th>
                                    <th class="width: 30%">Acciones</th>
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
                                <?php foreach ($tags as $item): ?>
                                    <tr>
                                        <td><?php echo $item->name; ?></td>
                                        <td>
                                            <?php echo anchor('admin/tags/edit/' . $item->id, lang('global:edit'), 'class="btn blue small"'); ?>
                                            <?php echo anchor('admin/tags/destroy/' . $item->id, lang('global:delete'), array('class' => 'confirm button btn red small')) ?>
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