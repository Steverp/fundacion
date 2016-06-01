<section class="cont_home">
	<section class="marco">
	    <!--Titulo-->
	    <div class="subtitulo titulo_int animated fadeInDown">
	        <h1>Accede a tu Cuenta</h1>
	    </div>
	      <div class="clear"></div>
	    <section class="cont_nosotros">
	    		
	    	<div class="bg_log_v elem_blancos animated fadeInUp">
	    	 <?php if (validation_errors()): ?>
	            <div class="alert-error">
	            	<i class="fa fa-warning animated zoomIn"></i>
	              <?php echo validation_errors();?>
	            </div>
	            <?php endif ?>

			   <?php echo form_open('users/login', array('class'=>'user_form form-horizontal'), array('redirect_to' => $this->input->post('redirect_to') ?: 'my-profile')) ?>

				  <fieldset>
				    <label for="email" class="col-sm-2 control-label"><?php echo lang('global:email') ?></label>				   
				      <!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
				      <?php echo form_input('email', $this->input->post('email') ? $this->input->post('email') : '', 'class="form-control"')?>
				  </fieldset>
				  <fieldset>
				    <label for="password" class="col-sm-2 control-label"><?php echo lang('global:password') ?></label>				   
				    <input type="password" class="form-control" id="password" placeholder="Contraseña" name="password" maxlength="20">
				  </fieldset>
				  <fieldset>
				      <div class="checkbox">
				        <label>
				          <?php echo form_checkbox('remember', '1', false) ?> Recordar contraseña.
				        </label>
				      </div>
				  </fieldset>
				  <fieldset>
				    <div class="text-center">
				      <button type="submit" class="btn_gris" value="Iniciar Sesión" name="btnLogin">Iniciar Sesión</button>
				    </div>
				  </fieldset>
				  <div class="reset_pass link2">
	               <?php echo anchor('users/reset_pass', lang('user:reset_password_link'));?>
	             </div>
			   <?php echo form_close() ?>    
			</div>

	    </section>

    </section><!--Marco-->	
</section>
