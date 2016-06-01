<section class="item">
    <div class="content">
        <h2>Links Destacados</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-destacado"><span><?php echo $titulo; ?></span></a></li>
            </ul>
            <div class="form_inputs" id="page-bibliografia">
                <?php echo form_open_multipart(site_url('admin/home/update_links/' . $outstanding->id . '/' . $lang_admin), 'class="crud"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="text">Titulo</label>
                                <div class="input">
                                    <?php echo form_input('title', $outstanding->title, 'class="dev-input-title"'); ?>
                                </div>
                            </li>
                            <li>
                                <label for="text">Link</label>
                                <div class="input">
                                    <?php echo form_input('link', $outstanding->link, 'class="dev-input-title"'); ?>
                                </div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>