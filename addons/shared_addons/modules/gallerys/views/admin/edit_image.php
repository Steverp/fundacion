<section class="title">
    <h4>Galeria / <?php echo ucfirst($gallery->name) ?> / Imagenes</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-gallery"><span>Editar Imagen</span></a></li>
            </ul>
            <div class="form_inputs" id="page-gallery">
                <?php echo form_open_multipart(site_url('admin/gallerys/upload_image')); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Imagen
                                    <small>
                                        - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <?php if (!empty($gallery_images->path)): ?>
                                        <div>
                                            <img src="<?php echo val_image($gallery_images->path) ?>" width="298">
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('image', '', ' id="image"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title">Titulo</label>
                                <div class="input"><?php echo form_input('title', $gallery->title, 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <input type="hidden" name="id_gallery" value="<?php echo $gallery_images->gallery_id ?>">
                        <input type="hidden" name="id_img" value="<?php echo $gallery_images->id ?>">
                        <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
                        <a href="<?php echo site_url('admin/gallerys/images/' . $gallery->id) ?>" class="btn red cancel">Cancelar</a>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>