<section class="item">
    <div class="content">
        <h2>Banner</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-banner"><span><?php echo $titulo; ?></span></a></li>
            </ul>
            <div class="form_inputs" id="page-banner">
                <?php echo form_open_multipart(site_url('admin/home/update_banner/' . (isset($banner) ? $banner->id : '0') . '/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
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
                                    <?php if (!empty($banner->image)): ?>
                                        <div>
                                            <img src="<?php echo site_url($banner->image) ?>" width="298">
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
                                <label for="name">Titulo</label>
                                <div class="input"><?php echo form_input('title', (isset($banner->title)) ? $banner->title : set_value('title'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Texto </label>
                                <div class="input">
                                    <textarea name="text"><?php echo (isset($banner->text)) ? $banner->text : set_value('text'); ?></textarea>
                                </div>
                            </li>
                            <li>
                                <label for="name">Link</label>
                                <div class="input"><?php echo form_input('link', (isset($banner->link)) ? $banner->link : set_value('link'), 'class="dev-input-url"'); ?></div>
                            </li>
                        </ul>
                        <?php
                        echo (isset($banner)) ? form_hidden('id', $banner->id) : null;
                        $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                        ?>
                    </fieldset>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>