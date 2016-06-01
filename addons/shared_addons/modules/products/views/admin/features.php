<section class="title">
    <h4>Productos / <?php echo ucfirst($product->name) ?> / Caracteristicas</h4>
    <a href="<?php echo site_url('admin/products') ?>" class="btn small">Volver</a>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-products"><span>Volver</span></a></li>
            </ul>

            <!-- IMAGENES -->
            <div class="form_inputs" id="page-products">
                <fieldset>

                    <?php echo anchor('admin/products/create_feature/' . $product->id, '<span>+ Nueva Caracteristica</span>', 'class="btn blue"'); ?>					

                    <br>
                    <br>

                    <?php if (!empty($features)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 70%">Caracteristica</th>
                                    <th style="width: 30%">Tipo</th>
                                    <th style="width: 30%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($features as $feature): ?>
                                    <tr>
                                        <td>
                                            <?php echo $feature->text; ?>
                                            
                                        </td>
                                        <td>
                                            <?php echo $feature->type; ?>
                                            
                                        </td>
                                        <td>
                                            <?php echo anchor('admin/products/destroy_feature/' . $feature->id . '/' . $product->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                            <?php echo anchor('admin/products/edit_feature/' . $feature->id . '/' . $product->id, lang('global:edit'), array('class' => 'btn red small button')) ?>
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