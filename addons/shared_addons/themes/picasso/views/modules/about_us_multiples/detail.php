<main class="detail workteam">
	<div class="container">
		<div class="row">
			<div class="col s12">
			<div class="actions">
				<h1 class="left">{{ data.name }}</h1>
				<a class="btn-floating waves-effect waves-light tooltipped right  return" href="javascript:history.back(1)" data-position="left" data-delay="0" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}} Return {{ else }} Volver {{ endif }}"><i class="fa fa-arrow-left"></i></a>
				<div class="clear"></div>
			</div>
				
			</div>
			<div class="col s12 ">
				<article>
					<figure style="background-image: url('{{data.image}}')" title="{{name}}"></figure>
					<div class="position"><i class="fa fa-graduation-cap"></i>{{data.office}}</div>
					<h3>Formación profecional</h3>
						<ul>
							<li class="tittle">Lorem ipsum dolor sit amet</li>
							<li >Lorem ipsum dolor sit amet</li>
							<li class="tittle">Lorem ipsum dolor sit amet</li>
							<li>Lorem ipsum dolor sit amet</li>
						</ul>
					<a href="mailto:" class="mail hide"><i class="fa fa-envelope"></i>{{data.email}}</a>
					
					<div class="text">{{ data.description }}</div>
				</article>
			</div>
		</div>
	</div>
</main>