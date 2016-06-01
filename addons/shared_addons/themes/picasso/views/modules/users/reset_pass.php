<section class="cont_home">
    <section class="marco">
        <!--Titulo-->
        <div class="subtitulo titulo_int animated fadeInDown">
            <h1>Restablecer Contraseña</h1>
        </div>
          <div class="clear"></div>
        <section class="cont_nosotros">
                
            <div class="bg_log_v elem_blancos animated fadeInUp">
                <div class="form">
                    <?php if(!empty($error_string)):?>
                        <div class="alert-error">
                            <?php echo $error_string;?>
                        </div>
                    <?php endif;?>
                    
                    <?php if(!empty($success_string)): ?>
                        <div class="alert-success">
                            <i class="fa fa-thumbs-o-up"></i>
                            <?php echo $success_string ?>
                        </div>
                    <?php else: ?>      

                    <?php echo form_open('users/reset_pass', array('class'=>'user_form form-horizontal')) ?>
                        <fieldset>                 
                            <label>Ingrese su dirección de correo electrónico o nombre de usuario</label>
                            <input type="text" name="email" maxlength="100" value="<?php echo set_value('email') ?>" placeholder="E-mail..." />              
                        </fieldset>  

                        <div class="form_buttons center drop-buttons">
                            <button class="btn_gris" type="submit" value="<?php echo lang('user:reset_pass_btn') ?>" name=""><span>Restablecer</span></button>
                        </div>
                
                    <?php echo form_close() ?>

                    <?php endif ?>
                </div>
                   
            </div>

        </section>

    </section><!--Marco-->  
</section>

