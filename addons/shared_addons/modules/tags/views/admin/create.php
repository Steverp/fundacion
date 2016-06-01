<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-tag"><span>Nuevo Tag</span></a></li>
            </ul>

            <div class="form_inputs" id="page-tag">
                <?php echo form_open_multipart(site_url('admin/tags/store/'), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="name">Nombre <span>*</span></label>
                            <div class="input"><?php echo form_input('name', set_value('name'), ' style="width: 350px;"'); ?></div>
                        </li>
                    </ul>
                </fieldset>

                <div class="buttons float-right padding-top">
                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                </div>

                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>