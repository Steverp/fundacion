<?php if ($comments): ?>

<?php foreach ($comments as $item): ?>

<div class="comment">

	<div class="details">
		<div class="row">
			<div class="col s12 l3 comments-profile">
				<div class="row">
					<div class="col l4 ">
						<div class="image">
							<?php echo gravatar($item->user_email, 60) ?>
						</div>
					</div>
					<div class="col l8 ">
						<div class="name ">
							<?php echo $item->user_name ?>
						</div>
						<div class="date ">
							<p>
								<?php echo format_date($item->created_on) ?></p>
						</div>
					</div>
				</div>
			</div>
			<div class="col s12 l9 m9 ">


				<?php if (Settings::get( 'comment_markdown') and $item->parsed): ?>
				<?php echo $item->parsed ?>
				<?php else: ?>
				<div class="comments-text">
					<?php echo nl2br($item->comment) ?></div>
				<?php endif ?>
			</div>

		</div>

	</div>
</div>


<?php endforeach ?>

<?php else: ?>
<p>
	<?php echo lang( 'comments:no_comments') ?>
</p>
<?php endif ?>