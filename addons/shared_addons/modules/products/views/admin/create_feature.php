<section class="title">
    <h4>Servicios / <?php echo ucfirst($product->name) ?> / Caracteristicas</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-product"><span>Nueva Caracteristica</span></a></li>
            </ul>
            <div class="form_inputs" id="page-product">
                <?php echo form_open_multipart(site_url('admin/products/store_feature/'. $product->id)); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Texto
                                    <span>*</span>
                                </label>
                                <div class="input">
                                    <textarea name="text" class="wysiwyg-simple"></textarea>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="name">Texto
                                    <span>*</span>
                                </label>
                                <div class="input">
                                    <select name="kind">
                                        <option value="1">
                                            Caracteristica
                                        </option>
                                        <option value="2">
                                            Beneficio
                                        </option>
                                    </select>
                                </div>
                                <br class="clear">
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <input type="hidden" name="id_pro" value="<?php echo $product->id ?>">
                        <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
                        <a href="<?php echo site_url('admin/products/features/' . $product->id) ?>" class="btn red cancel">Cancelar</a>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>