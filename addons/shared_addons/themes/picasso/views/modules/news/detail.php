<main class="detail">
	
	<div class="container">
		<div class="row">
			<div class="col s12">
	          <div class="actions">
	          <h1><div class="left wow fadeInDown">{{ data.title }}</div></h1>
<!--
                    <a href="{{ url:base }}products/add_product_contact/{{product.id}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Agregar producto al contacto"><i class="fa fa-plus"></i> </a>
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Ficha técnica {{ endif }}"><i class="fa fa-cloud-download"></i> </a>
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Cátalogo {{ endif }}"><i class="fa fa-download"></i> </a>
-->
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}"><i class="fa fa-arrow-left"></i> </a>
                    <div class="clear"></div>
                </div>
			<div class="col s12">
				<article>
		
						<figure style="background-image: url('{{ data.image }}')" title="{{ data.title }}"></figure>
					<div class="date"><i class="fa fa-calendar-o"></i>{{ data.date }}</div>
					{{if data.autor}}
					<div class="autor"><i class="fa fa-user"></i>{{data.autor}}</div>
					{{endif}}
					<div class="text">{{ data.content }}</div>
					<div class="clear"></div>
				</article>
				<div class="clear"></div>
			</div>
		</div>
	</div>






	
</main>