<?php echo form_open( "comments/create/{$module}", 'id="create-comment"') ?>
<noscript>
	<?php echo form_input( 'd0ntf1llth1s1n', '', 'style="display:none"') ?>
</noscript>

	<h4><?php echo lang('comments:your_comment') ?></h4>
	<div id="commentPost" class="">
		<?php echo form_hidden( 'entry', $entry_hash) ?>
		<?php if ( ! is_logged_in()): ?>
		<div class="input-field col s12">
			<!-- <label for="name"><?php echo lang('comments:name_label') ?><span class="required">*</span>:</label> -->
			<input type="text" name="name" id="name" maxlength="40" value="<?php echo $comment['name'] ?>" class="form-control" />
			<label for="name">
				<?php echo lang( 'comments:name_label') ?>
			</label>
		</div>
		<div class="input-field col s12">
			<!-- <label for="email"><?php echo lang('global:email') ?><span class="required">*</span>:</label> -->
			<input type="text" name="email" maxlength="40" value="<?php echo $comment['email'] ?>" class="form-control" />
			<label for="email">
				<?php echo lang( 'global:email') ?><span class="required">*</span>
			</label>
		</div>
		<div class="input-field col s12 hide">
			<!-- <label for="website"><?php echo lang('comments:website_label') ?>:</label> -->
			<input type="text" name="website" maxlength="40" placeholder="<?php  echo lang('comments:website_label')  ?>" value="<?php echo $comment['website'] ?>" class="form-control" />
		</div>
		<?php endif ?>
		<div class="input-field col s12">
			<textarea name="comment" id="comment" rows="5" cols="30" class="materialize-textarea">
				<?php echo $comment[ 'comment'] ?>
			</textarea>
			<label for="comment">
				<?php echo lang( 'comments:message_label') ?>
			</label>
		</div>

		<div class="form_submit">
			<?php echo form_submit( 'submit', lang( 'comments:send_label'), 'class = "btn btn-primary"') ?>
		</div>
		<div class="clear"></div>
	</div>
		<div class="clear"></div>
	<?php echo form_close() ?>
