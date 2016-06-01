<section class="item">
    <div class="content">
        <h2>Nuestros Asociados</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-principal"><span><?php echo $titulo; ?></span></a></li>
            </ul>

            <div class="inline-form" id="page-principal">
                <?php echo form_open_multipart(site_url('admin/about_us_multiples/update_partners/' . (isset($dataForm) ? $dataForm->id : '0') . '/' . $lang_admin), 'class="crud"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="name">Imagen
                                <small>
                                    - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    - Todas las imagenes deben ser del mismo tamaño
                                </small>
                            </label>
                            <?php if (!empty($dataForm->image)): ?>
                                <div>
                                    <img src="<?php echo site_url($dataForm->image) ?>" width="298">
                                </div>
                            <?php endif; ?>
                            <div class="btn-false">
                                <div class="btn">Examinar</div>
                                <?php echo form_upload('image', set_value('image'), ' id="image"'); ?>
                            </div>
                            <?php if (!isset($dataForm)): ?>
                                <br/>
                                <br/>
                                <br/>
                                <br/>
                            <?php endif; ?>
                        </li>
                        <li>
                            <label for="link">Link </label>
                            <div class="input"><?php echo form_input('link', (isset($dataForm->link)) ? $dataForm->link : set_value('link'), 'class="dev-input-title" style="width:100%"'); ?></div>
                        </li>
                    </ul>
                    <?php
                    $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                    ?>
                </fieldset>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>