<section class="title">
    <h4>Estados</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-proces"><span>Nuevo Estado</span></a></li>
            </ul>
            <?php echo form_open_multipart(site_url('admin/process/store_est'), 'id="form-wysiwyg"'); ?>
            <div class="form_inputs" id="page-proces">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo</label>
                                <div class="input"><?php echo form_input('name', set_value('name'), 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>
                    <div class="buttons float-right padding-top">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
            </div>
            <?php echo form_close(); ?>

        </div>
    </div>
</section>