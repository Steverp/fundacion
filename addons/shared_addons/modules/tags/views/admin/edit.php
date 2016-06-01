<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-tags"><span>Editar Tags</span></a></li>
            </ul>

            <div class="form_inputs" id="page-tag">
                <?php echo form_open_multipart(site_url('admin/tags/update/'), 'id="form-wysiwyg"'); ?>
                <fieldset>
                    <ul>
                        <li>
                            <label for="name">Nombre <span>*</span></label>
                            <div class="input"><?php echo form_input('name', $tag->name, ' style="width: 350px;"'); ?></div>
                        </li>
                    </ul>
                </fieldset>

                <div class="buttons float-right padding-top">
                    <?php echo form_hidden('id', $tag->id) ?>
                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                </div>

                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>