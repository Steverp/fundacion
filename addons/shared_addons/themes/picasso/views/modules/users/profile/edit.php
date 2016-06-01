<section class="cont_home m_b_40">
    <!--Titulo-->
    <div class="titulos animated fadeInDown marco">
        <h1>Editar tu perfil</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">

        <?php if (validation_errors()): ?>		      
		<div class="alert alert-danger alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
						&times;
					</button>
					<?php echo validation_errors(); ?>
		      </div>
		    </div>
		</div>
		<?php endif; ?>

		<?php echo form_open_multipart('', array('id'=>'user_edit', 'class' => 'crud_form')); ?>
        <!--Item Tab-->
        <section class="large-12 medium-12 small-12 columns m_b_20 nosotros_items">
            <ul class="marco">
              <li>
                <a href="#nombre">
                    Nombre
                </a>
              </li>
              <li>
                <a href="#email">
                    E-mail
                </a>
              </li>
	      	</ul>
        </section>
        <!--Fin Item Tab-->
        <!-- Contenidos Tab -->
        <div class="tab_content m_b_30 marco elem_blancos">
            <div class="cont_tab active dats_editar form_edit" id="nombre">

      			<div class="large-6 medium-6 small-12 columns">
					<label class="control-label" for="display_name"><?php echo lang('profile_display_name'); ?></label>
		            <div class="controls">
		            	<?php echo form_input(array('name' => 'display_name', 'id' => 'display_name', 'value' => set_value('display_name', $display_name))); ?>
		            </div>
	          	</div>
				<?php foreach($profile_fields as $field): ?>
					<?php if($field['input']): ?>
					<div class="large-6 medium-6 small-12 columns">
						<label class="control-label" for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
			            <div class="controls">
			            	<?php echo $field['input']; ?>
			            	<p class="help-block"><?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?></p>
			            </div>
		          	</div>		
					<?php endif; ?>
				<?php endforeach; ?>

                <!-- {{ pagination }} -->
                <div class="clear"></div>                 
            </div>
            <div class="cont_tab dats_editar form_edit" id="email">

            		<div class="large-6 medium-6 small-12 columns">
						<label class="control-label" for="email"><?php echo lang('global:email') ?></label>
            			<div class="controls">
							<?php echo form_input('email', $_user->email); ?>
						</div>
      				</div>
      				<div class="large-6 medium-6 small-12 columns">
						<label class="control-label" for="password"><?php echo lang('global:password') ?></label>
            			<div class="controls">
            				<?php echo form_password('password', '', 'autocomplete="off"'); ?>
            			</div>
      				</div>

	          		</div>
	          		<?php if ($api_key): ?>
          			<?php if (Settings::get('api_enabled') and Settings::get('api_user_keys')): ?>
					<script>
					jQuery(function($) {	
						$('input#generate_api_key').click(function(){
								
							var url = "<?php echo site_url('api/ajax/generate_key') ?>",
								$button = $(this);
								
							$.post(url, function(data) {
								$button.prop('disabled', true);
								$('span#api_key').text(data.api_key).parent('li').show();
							}, 'json');
						});
					});
					</script>
					<?php endif; ?>
	          		<div class="tab-pane" id="C">
	        			<div class="large-6 medium-6 small-12 columns">
							<label class="control-label" for="email"><?php echo lang('user_email') ?></label>
				            <div class="controls">
				            	<?php $api_key or print('style="display:none"') ?>><?php echo sprintf(lang('api:key_message'), '<span id="api_key">'.$api_key.'</span>'); ?>
				            </div>
			          	</div>
			          	<div class="large-6 medium-6 small-12 columns">
							<label class="control-label" for="email"><?php echo lang('user_email') ?></label>
				            <div class="controls">
				            	<input type="button" id="generate_api_key" value="<?php echo lang('api:generate_key') ?>" />
				            </div>
			          	</div>
	        		</div>
	        		<?php endif; ?>


                  <div class="clear"></div>                
            </div>
        </section>
        <!-- Contenidos Tab -->

        <div class="marco">
        	<div class="linea_p"></div>
			<?php echo form_submit('btnSubmit', lang('profile_save_btn'), 'class="btn_gris border_b"'); ?>
		</div>

		<?php echo form_close(); ?>

    </section>
</section>

