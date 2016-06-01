<section class="title">
    <h4>Estados</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-proces"><span>Editar Estado</span></a></li>
            </ul>
            <?php echo form_open_multipart(site_url('admin/process/update_est/' . $doc->id), 'id="form-wysiwyg"'); ?>

            <div class="form_inputs" id="page-proces">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo</label>
                                <div class="input"><?php echo form_input('name', $doc->name, 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $doc->id); ?>
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>