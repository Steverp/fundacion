<section class="cont_home">
    <section class="marco">
        <!--Titulo-->
        <div class="subtittle titulo_int animated fadeInDown">
            <h1>Cuenta activada</h1>
        </div>
          <div class="clear"></div>
        <section class="cont_nosotros">
                
            <div class="bg_log_v elem_blancos animated fadeInUp">
               
                <div class="alert-success"><?php echo $this->lang->line('user:activated_message') ?></div>
				<div class="form">
					<?php echo form_open('users/login', array('class'=>'user_form form-horizontal')) ?>
                		<fieldset>
							<label><?php echo lang('global:email') ?></label>
							<?php echo form_input('email') ?>
						</fieldset>
						
						<fieldset>
							<label><?php echo lang('global:password') ?></label>
							<?php echo form_password('password') ?>
						</fieldset>
						
						<div class="form_buttons center drop-buttons">
							<input class="btn_gris" type="submit" value="<?php echo lang('user:login_btn') ?>" name="btnLogin" />
						</div>
					</ul>
					<?php echo form_close() ?>						
				</div>
                   
            </div>

        </section>

    </section><!--Marco-->  
</section>
