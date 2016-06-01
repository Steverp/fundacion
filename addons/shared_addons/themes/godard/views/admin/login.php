<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">

<head>
	<meta charset="utf-8">
	<meta name=viewport content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="robots" content="noindex,nofollow">
	<title>
		<?php echo $this->settings->site_name; ?> -
		<?php echo lang( 'login_title');?>
	</title>
	<base href="<?php echo base_url(); ?>" />
	<meta name="robots" content="noindex, nofollow" />
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<?php Asset::css( 'frameworks/materialize.min.css'); ?>
	<?php Asset::css( 'themes/default.min.css'); ?>
	<?php Asset::css( 'base.min.css'); ?>
	<?php Asset::js( 'libs/jquery/jquery-1.11.0.min.js'); ?>
	<?php Asset::js( 'libs/materialize.min.js'); ?>
	<?php Asset::js( 'main.js'); ?>
	<?php echo Asset::render() ?>
</head>

<body class="loguin">
	<main class="loguin">
		<div class="container">
			<div class="row">
				<img src="addons/shared_addons/themes/Godard/img/contactenos-ahorranito.png" alt="">
				<div class="box">
					<div class="col s12 l6">
						<div class="help-info">
							<h1>Bienvenido al administrador</h1>
							<div class="text">Es la solución en cuanto a gestión y administración de sitios web se refiere. Es una plataforma de amigable interfaz, con sencillos procesos para la gestión de tus contenidos.</div>
							<div class="help">
								<div class="icon"> <i class="fa fa-info-circle"></i> </div>
								<span>
						 Debes ingresar con el usuario y contraseña que te hicimos llegar cuando recibiste el proyecto.</span>
							</div>
						</div>
					</div>
					<div class="col s12 l6">
						<div class="form">
							<?php $this->load->view('admin/partials/notices') ?>
							<?php echo form_open( 'admin/login', array( 'autocomplete'=>'off')); ?>
							<div class="input-field">
								<input id="email" type="text" name="email">
								<label for="email">
									<?php echo lang( 'global:email'); ?>
								</label>
							</div>
							<div class="input-field">
								<input id="password" type="password" name="password">
								<label for="password">
									<?php echo lang( 'global:password'); ?>
								</label>
							</div>
							<div class="input-field remember">
								<input type="checkbox" id="remember" name="remember" />
								<label for="remember">
									<?php echo lang( 'user:remember'); ?>
								</label>
							</div>
							<button id="login-submit" class="btn" ontouchstart="" type="submit" name="submit" value="<?php echo lang('login_label'); ?>">
								<?php echo lang( 'login_label'); ?>
							</button>
							<?php echo form_close(); ?>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<h2>Conoce más de nuestros productos</h2>
				<div class="col s12 l3 ">
					<a href="http://imaginamos.com/" class="add" target="_blank">
						<h3>CRM</h3>
						<div class="text">Maneja, controla y sistematiza tu fuerza de ventas</div>
					</a>
				</div>
				<div class="col s12 l3 ">
					<a href="http://imaginamos.com/" class="add" target="_blank">
						<h3>INTRANETS</h3>
						<div class="text">Páginas web para empresas y manejo de su comunicación interna</div>
					</a>
				</div>
				<div class="col s12 l3 ">
					<a href="http://imaginamos.com/" class="add" target="_blank">
						<h3>TIENDAONLINE</h3>
						<div class="text">Tu plataforma para e-commerce</div>
					</a>
				</div>
				<div class="col s12 l3 ">
					<a href="http://imaginamos.com/" class="add" target="_blank">
						<h3>HOSTING</h3>
						<div class="text">Aloje su página web con una agencia de primer nivel</div>
					</a>
				</div>
			</div>
		</div>
	</main>
	<footer class="loguin">
		<div class="container">
			<div class="ahorranito">
				<a href="http://imaginamos.com/" target="_blank">Diseño web <div class="ahorranito-icon"></div> imagin<span>a</span>mos.com</a> </div>

		</div>
	</footer>
</body>



</html>