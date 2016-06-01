<section class="item">
    <div class="content">
        <h2>Panel de Texto</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-principal"><span><?php echo $titulo; ?></span></a></li>
            </ul>

            <div class="inline-form" id="page-principal">
                <?php echo form_open_multipart(site_url('admin/about_us_multiples/store_customers/'. $lang_admin), 'class="crud"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="link">Titulo </label>
                            <div class="input"><?php echo form_input('link', set_value('link'), 'class="dev-input-title" style="width:100%"'); ?></div>
                        </li>
                        <li>
                            <label for="link">Texto </label>
                            <div class="input">
                                <textarea name="image" class="wysiwyg-simple"><?php echo set_value('image');?></textarea>
                            </div>
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