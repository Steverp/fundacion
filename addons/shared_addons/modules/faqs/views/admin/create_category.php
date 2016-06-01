<section class="title">
    <h4>Preguntas Frecuentes / Categorias</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-category"><span>Nueva Categoria</span></a></li>
            </ul>
            <div class="form_inputs" id="page-category">
                <?php echo form_open_multipart(site_url('admin/faqs/store_category/'.$lang_admin), ''); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Titulo <span>*</span></label>
                                <div class="input"><?php echo form_input('title', set_value('title'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <input type="hidden" value="0" name="parent">
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>