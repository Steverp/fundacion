<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->
    <div class="titulos animated fadeInDown">
        <h1>{{data:title}}</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">
        <div class="large-6 medium-6 small-12 columns p_r_20 m_b_20 wow fadeInUp" data-wow-delay="0.1s">
            <div class="marco_nos">
            {{ if data:image }}
               <img src="{{ data:image }}">
            {{ endif }}
            </div>
        </div>
        <div class="large-6 medium-6 small-12 columns p_l_20 m_b_20 wow fadeInUp" data-wow-delay="0.2s">
            <div class="marco_nos">
            {{ if data:image }}
                    {{ data:video }}
            {{ endif }}        
            </div>
        </div>
        <div class="large-12 medium-12 small-12 columns m_b_40">
            <p>{{ data:text }}</p>
        </div>
    </section>
 </section> 
</section>

