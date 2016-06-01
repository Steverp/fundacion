{{ if banner }}
<section class="bg_slider" style="display:inline-block">        
   <div class="tp-banner" >
        <ul>
        {{ banner }}
            <li data-transition="boxfade" data-slotamount="7" data-masterspeed="300" data-delay="6000"  data-saveperformance="off">
              <img src="{{image}}" alt="{{title}}" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat" />
                    <!-- Textos -->
                    <h3 class="tp-caption title_custom_big_white lft tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="148" data-voffset="-50"
                        data-speed="300"
                        data-start="700"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="300"
                        style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">
                        {{text}}
                    </h3>
                    <h1 class="tp-caption title_custom_big_white lft tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="175" data-voffset="-50"
                        data-speed="300"
                        data-start="700"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="300"
                        style="z-index: 2; max-width: auto; max-height: auto; white-space: nowrap;">
                        {{title}}
                    </h1>
                    <div class="tp-caption sfb tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="360" data-voffset="50"
                        data-speed="300"
                        data-start="1200"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="300">
                      <a href="{{ link }}" class="btn btn-transparent-2 btn-lg btn_gris">IR A LA COLECCIÓN</a>
                    </div>
            </li>
        {{ /banner }}
        </ul>
    </div>
      
</section>
{{ endif }}

<!--Texto Intro-->
<section class="bg_text_introductorio m_b_40">
	<div class="marco">
		<div class="subtitulo">
			<h1>{{ text_info:title }}</h1>
		</div>	
		<p><b>{{ text_info:date }}:</b> {{ text_info:text }}</p>
	</div>
</section>
<!--Fin Texto Intro-->


<!--Products-->
<section class="bg_dest_prod m_b_40">
	<div class="marco">
		<div class="subtitulo">
			<h1>{{ if {session:data name="lang_code"} == 'en'}}PRODUCTS {{ else }}PRODUCTOS {{ endif }} <b>{{ if {session:data name="lang_code"} == 'en'}}Featured{{ else }}Destacadas {{ endif }}</b></h1>
		</div>	
	</div>

	<div class="prod_destacados">
		{{products}}

		<figure class="small-12 large-3 medium-3 fadeInUp wow">
			<img src="{{image}}"/>
			<a href="{{link}}">
			<figcaption>
				<h3>{{name}}</h3>
				<p>{{introduction}}</p>
				<span>{{ if {session:data name="lang_code"} == 'en'}}See More{{ else }}Ver Más {{ endif }}</span>
			</figcaption>			
			</a>
		</figure>

		{{/products}}
	</div>
</section>
<!--Fin Products-->

<div class="clear"></div>

<!--Noticias-->
<section class="bg_noticias_dest m_b_40">
	<div class="marco">
		<div class="subtitulo">
			<h1>{{ if {session:data name="lang_code"} == 'en'}}NEWS{{ else }}NOTICIAS {{ endif }} <b>{{ if {session:data name="lang_code"} == 'en'}}Featured{{ else }}Destacadas {{ endif }}</b></h1>
		</div>	
	</div>
	<div class="prod_destacados">
		{{outstanding_news}}
		<figure class="small-12 large-3 medium-3 fadeInUp wow">
			<img src="{{image}}"/>
			<a href="{{link}}">
			<figcaption>
				<h3>{{title}}</h3>
				<p>{{text}}</p>
				<span>{{ if {session:data name="lang_code"} == 'en'}}See More{{ else }}Ver Más {{ endif }}</span>
			</figcaption>			
			</a>
		</figure>
		{{/outstanding_news}}
	</div>
</section>
<!--Fin Noticias-->

<div class="clear"></div>


<!-- Servicios  -->
<section class="bg_dest_prod m_b_40">
	<div class="marco">
		<div class="subtitulo">
			<h1><b>{{ if {session:data name="lang_code"} == 'en'}}SERVICES{{ else }}SERVICIOS {{ endif }}</b> {{ if {session:data name="lang_code"} == 'en'}}Featured{{ else }}Destacadas {{ endif }}</h1>
		</div>	
	</div>
	<div class="prod_destacados">
		{{outstanding_services}}
		<figure class="small-12 large-3 medium-3 fadeInUp wow">
			<img src="{{image}}" alt="{{title}}"/>
			<a href="{{link}}">
			<figcaption>
				<h3>{{title}}</h3>
				<p>{{text}}</p>
				<span>{{ if {session:data name="lang_code"} == 'en'}}See More{{ else }}Ver Más {{ endif }}</span>
			</figcaption>			
			</a>
		</figure>
		{{/outstanding_services}}
	</div>
</section>
<!-- Fin Servicios  -->


<div class="clear"></div>

<!-- CLIENTE -->
<section class="bg_clente">
	<section class="marco">
		<div class="subtitulo">
		   <h1>{{ if {session:data name="lang_code"} == 'en'}}OUR {{ else }}NUESTROS {{ endif }} <b>{{ if {session:data name="lang_code"} == 'en'}}ALLIES{{ else }}ALIADOS {{ endif }}</b></h1>
		</div>
		{{ if customers }}
		<ul class="carrusel_marcas fadeInUp wow">
		    {{ customers }}
		    <li class="item">
		      <a href="{{ link }}" target="_blank">
		        <img src="{{ image }}" alt="{{ text }}">
		      </a>
		    </li>   
		    {{ /customers }}    
		</ul>
		{{ endif }}
	</section>
</section>


