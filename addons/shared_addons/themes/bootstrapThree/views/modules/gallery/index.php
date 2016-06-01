<section class="cont_home m_b_40">
    <!--Titulo-->
    <div class="titulos animated fadeInDown marco">
        <h1>Galería</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">

        <div class="text_introduc marco">
            <p>{{ intro.text }} </p>
        </div>

        <!--Item Tab-->
        <section class="large-12 medium-12 small-12 columns m_b_20 nosotros_items">
            <ul class="marco">
              <li>
                <a href="#imagenes">
                    Imágenes
                </a>
              </li>
              <li>
                <a href="#videos">
                    Videos
                </a>
              </li>
        </section>
        <!--Fin Item Tab-->
        <!-- Contenidos Tab -->
        <div class="tab_content m_b_30 marco">
            <div class="cont_tab active galerias_bg" id="imagenes">
                {{ gallery }}
                    {{ if type == 1 }}
                        <li class="large-4 medium-4 small-12 columns popup_gallery">
                            <a href="{{ content }}" title="{{ title }}"  data-effect="mfp-zoom-in">
                                <div class="over_gal"><i class="fa fa-search"></i></div>
                                <img src="{{ content }}" alt="{{ title }}" class="transition" />
                            </a>
                        </li>   
                    {{ endif }}
                {{ /gallery }}
                <!-- {{ pagination }} -->
                <div class="clear"></div>                 
            </div>
            <div class="cont_tab galerias_bg" id="videos">
                 {{ gallery }}        
                    {{ if type == 2 }}
                        <li class="large-4 medium-4 small-12 columns">
                            <a class="popup_youtube" href="{{content}}"  data-effect="mfp-zoom-in">
                                <div class="over_gal"><i class="fa fa-play-circle-o"></i></div>
                                <img src="{{content_img}}" alt="" class="transition" />
                            </a>
                        </li>  
                    {{ endif }}
                {{ /gallery }}
                <!-- {{ pagination }} -->

                  <div class="clear"></div>                
            </div>
        </section>
        <!-- Contenidos Tab -->

    </section>
</section>


     


