<main class="detail process">
	<h1><div class="container wow fadeInDown">{{ process.title }}</div></h1>
	<div class="container">
		<div class="row noMargin">
			<div class="col s12">
				<div class="actions">

			
					<div class="clear"></div>
				</div>
			</div>
		<div class="col s8">
				<div class="intro">{{ process.introduction }}</div>
				<div class="text">{{ process.description }}</div>
				<div class="clear"></div>
				</article>
			</div>
			<div class="col s4">
				<div class="process-status">
						<a class="right" href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}">Atrás</a>
						<div class="clear"></div>
					<div class="autor"><strong>Número del proceso:</strong> {{process.cod}}</div>
					<div class="autor"><strong>Actuaciones:</strong> {{ estado.name }}</div>
							{{ if docs }} <h3>Historial</h3>{{ docs }}
		<a href="{{file}}"><i class="fa fa-file-pdf-o"></i>{{name}}</a> {{ /docs }} {{ endif }}

				</div>
				<article>
			</div>
	
		</div>

	</div>
	</div>
</main>