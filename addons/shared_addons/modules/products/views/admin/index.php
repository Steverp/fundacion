<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Productos</h4>
    </section>

<section class="item">
    <div class="content">

        <fieldset id="filters" class="two">
            <legend>Filtros</legend>
            <?php echo form_open_multipart(site_url('admin/products/index/' . $lang_admin), ''); ?>
            <ul>
                <li>
                    <?php echo form_input('shearch', set_value('shearch'), 'style="width:80%" maxlength="100" placeholder="Buscar Producto"'); ?>
                </li>
                <li>
                    <button type="submit" class="btn btn-default" style="margin-top: 5px" value="Buscar">Buscar</button>
                </li>
            </ul>
            <?php echo form_close(); ?>
        </fieldset>
        <a class="btn" href="<?php echo site_url('admin/products/import_products'); ?>">Importar Programas</a>


        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-products"><span>Listado de Productos</span></a></li>
                <li><a href="#page-structure-categories"><span>Estructura Categorias</span></a></li>
                <li><a href="#page-intro"><span>Introducción</span></a></li>
            </ul>

            <!-- PRODUCTOS -->
            <div class="form_inputs" id="page-products">
                <fieldset>
                    <?php
                    echo anchor('admin/products/create/' . $lang_admin, '<span>+ Nuevo Producto</span>', 'class="btn blue"');
                    if ($ordering):
                        echo anchor('admin/products/index/' . $lang_admin, '<span>Volver</span>', 'class="btn blue"');
                    else:
                        echo anchor('admin/products/index/' . $lang_admin . '/1/1', '<span>Ordenar Productos</span>', 'class="btn blue"');
                    endif;
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($products)): ?>
                        <div id="ajax_message_prod"></div>
                        <table border="0" class="table-list sort" cellspacing="0">
                            <thead>
                                <tr>
                                    <?php if ($ordering): ?>
                                        <th style="width: 5%"></th>
                                    <?php endif; ?>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 5%">Referencia</th>
                                    <th style="width: 10%">Precio</th>
                                    <th style="width: 40%">Introducción</th>
                                    <th style="width: 5%">Imagen</th>
                                    <th style="width: 5%">Destacado</th>
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
                            <tbody class="sortable_products">
                                <?php foreach ($products as $product): ?>
                                    <tr id="<?php echo $product->id ?>">
                                        <?php if ($ordering): ?>
                                            <td class="handle">
                                                <span>drag_handle.gif</span>   
                                            </td>
                                        <?php endif; ?>
                                        <td><?php echo $product->name ?></td>
                                        <td><?php echo $product->reference ?></td>
                                        <td><?php echo $product->price ?></td>
                                        <td><?php echo substr(strip_tags($product->introduction), 0, 100); ?>...</td>
                                        <td>
                                            <?php if (!empty($product->image)) { ?>
                                                <img src="<?php echo site_url($product->image); ?>" style="height: 40px;width: 40px">
                                            <?php } ?>
                                        </td>
                                        <td><a class="outstanding_product" href="admin/products/outstanding_product/<?php echo $product->id; ?>/<?php echo $lang_admin; ?>"><img src="<?php echo site_url() . 'uploads/default/' . ($product->outstanding == 1 ? 'estrella' : 'estrella_gris') . '.png'; ?>" border="0"></a> </td>
                                        <td>
                                            <?php echo anchor('admin/products/edit/' . $product->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/products/images/' . $product->id, "Imagenes", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/products/features/' . $product->id, "Caracteristicas", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/products/destroy/' . $product->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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
                    <?php echo anchor('admin/products/create_category/' . $lang_admin, '<span>+ Nueva Categoria</span>', 'class="btn blue"'); ?>
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
                <?php echo form_open_multipart(site_url('admin/products/update_intro/' . $lang_admin), 'id="form-wysiwyg"'); ?>
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