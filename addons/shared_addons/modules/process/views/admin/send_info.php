<section class="title">
    <h4>Correo de Informacion de Cambios en el proceso: <?php echo $process->title;?></h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <?php echo form_open_multipart(site_url('admin/process/send'), 'id="form-wysiwyg"'); ?>
            <div class="form_inputs" id="page-proces">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="title">Mensaje</label>
                                <div class="input">
                                    <textarea name="message" class="wysiwyg-advanced"><?php set_value('message');?></textarea>
                                </div>
                            </li>
                        </ul>
                    </fieldset>
                    <div class="buttons float-right padding-top">
                        <input type="hidden" name="mail" value="<?php echo $user->email;?>">
                        <input type="hidden" name="idUser" value="<?php echo $user->id;?>">
                        <input type="hidden" name="process" value="<?php echo $process->title;?>">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
            </div>
            <?php echo form_close(); ?>

        </div>
    </div>
</section>