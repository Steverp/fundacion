<main class="news">
		<h1><div class="container wow fadeInDown">{{ if {session:data name="lang_code"} == 'en'}}News{{ else }}Noticias{{ endif }} {{ category }}</div></h1>
	<div class="container">
		<div class="row">
			<div class="col s12">
				{{ news }}
				<article>
				<figure style="background-image: url('{{site:url}}{{image}}')" title="{{ title }}"></figure>
				
					<h2>{{ title }}</h2>
					<div class="date"><i class="fa fa-calendar-o"></i>{{ date }}</div>
					<div class="text">{{ introduction }}</div>
					<a class="btn-link" href="{{ urlDetail }}">{{ if {session:data name="lang_code"} == 'en'}}See more{{ else }}<i class="fa fa-angle-double-right"></i> Ver más {{ endif }}</a>
					<div class="icon"><i class="fa fa-newspaper-o"></i></div>
						<div class="clear"></div>
				</article>
				{{ /news }}
			</div>



            <div class="col s12">
                {{ news }}
                <article>
                <figure style="background-image: url(addons/shared_addons/themes/picasso/img/cold8.jpg)" title="{{ title }}"></figure>
                
                    <h2>{{ title }}</h2>
                    <div class="date"><i class="fa fa-calendar-o"></i>{{ date }}</div>
                    <div class="text">{{ introduction }}</div>
                    <a class="btn-link" href="{{ urlDetail }}">{{ if {session:data name="lang_code"} == 'en'}}See more{{ else }}<i class="fa fa-angle-double-right"></i> Ver más {{ endif }}</a>
                    <div class="icon"><i class="fa fa-newspaper-o"></i></div>
                        <div class="clear"></div>
                </article>
                {{ /news }}
            </div>


			<div class="col s12">{{ pagination }}</div>
		</div>
	</div>




</main>


