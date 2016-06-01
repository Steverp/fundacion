<main class="process">
	<h1><div class="container wow fadeInDown">Mis procesos</div></h1>
	<div class="panel">
		<div class="container">
			<div class="icon">
				<i class="fa fa-info"></i>
			</div>
			<p> hola <span>{{ user.username }}</span>, bienvenido al sistema de administración de procesos de <span>PEDRO ALFONSO HERNÁNDEZ Abogados Consultores</span>.</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			{{ if process }}
			<div class="col s12 l12">
				<div class="help">Puedes dar clic en el nombre del proceso para ampliar la información</div>
				<table border="0" class="striped responsive-table" cellspacing="0">
					<thead>
						<tr>
							<th style="width: 40%">Nombre del proceso</th>
							<th style="width: 30%">Número del proceso</th>
							<th style="width: 30%">Fecha</th>
							<th style="width: 30%">Actuación</th>
<!--							<th class="width: 10%">Acciones</th>-->
						</tr>
					</thead>
					<tbody>
						{{process}}
						<tr>
							<td><a class="tooltipped " href="{{link}}" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Clic para ver más {{ endif }}">{{title}}</a></td>
							<td>{{cod}}</td>
							<td class="date">22/05/2015</td>
							<td class="status">{{estado.name}}</td>
<!--
							<td class="tCenter">
								
								         <a class="btn-link tooltippedx " href="{{link}}" data-position="left" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Clic para para ver más {{ endif }}">Ver</a>
							</td>
-->
						</tr>
						{{/process}}
					</tbody>
				</table>
			</div>
			<div class="col s12 l4 hide">
				<?php echo form_open_multipart(site_url( 'process/userdocs/'. $user->id), 'class="filters"'); ?>
				<h2><i class="fa fa-search"></i>Buscar</h2>
				<div class="text">Puedes buscar por nombre, codigo o estado del proceso</div>
				<div class="input-field">
					<input type="text" name="title" id="name">
					<label for="name">Nombre del proceso</label>
				</div>
				<div class="input-field">
					<input type="text" name="cod" id="codigo">
					<label for="codigo">Código del proceso</label>
				</div>
				<div class="input-field">
					<select name="estado" class="browser-default">
						<option>Estado del proceso</option>
						{{estados}}
						<option value="{{id}}">{{name}}</option>
						{{/estados}}
					</select>
				</div>
				<input type="submit" class=" btn right" name="btnAction" value="Buscar">
				<div class="clear"></div>
				<?php echo form_close(); ?>
			</div>
			{{ else }}
			<p>No se encontraron procesos</p>
			{{ endif }}
		</div>
	</div>
	</div>
</main>