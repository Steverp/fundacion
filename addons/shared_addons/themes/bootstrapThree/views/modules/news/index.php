<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->
    <div class="subtittle titulo_int animated fadeInDown">
        <h1>{{ if {session:data name="lang_code"} == 'en'}}News{{ else }}Noticias {{ endif }}</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">

    	<ul class="list_noticias">
        {{ news }}
			<li class="large-12 medium-12 small-12 columns wow fadeInUp">
				<div class="large-5 medium-5 small-12 columns p_r_20">
					<a href="{{ urlDetail }}" class="bg_img">
							<img src="{{ image }}" alt="">
					</a>
				</div>
				<div class="large-7 medium-7 small-12 columns">
					<h3>{{ title }}</h3>
					<b>{{ date }}</b>
					<p>{{ introduction }}</p>
					<a class="btn_gris" href="{{ urlDetail }}">{{ if {session:data name="lang_code"} == 'en'}}See more{{ else }}Ver más {{ endif }}</a>
				</div>
			</li>
		{{ /news }}
		</ul>
		{{ pagination }}

    </section>
 </section> 
</section>

