<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->
    <div class="titulos animated fadeInDown">
        <h1>{{ product.name }}</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">        
          <div class="large-6 medium-6 small-12 columns p_r_20 m_b_20 wow fadeInUp" data-wow-delay="0.1s">
              <?php if(count($images) > 0){ ?>
              <div id="amazingslider-1" style="display:block;position:relative;margin:16px auto 86px;">
                  <ul class="amazingslider-slides" style="display:none;">
                    {{videos}}
                      <li><img src="http://img.youtube.com/vi/{{img_video}}/0.jpg" />
                        <video preload="none" src="{{video}}" ></video>
                      </li>
                    {{/videos}}
                      
                      {{images}}
                      <li><img src="{{ path }}" alt="{{title}}" /></li>
                      {{/images}}
                  </ul>
                  <ul class="amazingslider-thumbnails" style="display:none;">
                      {{videos}}
                        <li><img src="http://img.youtube.com/vi/{{img_video}}/0.jpg" /></li>
                      {{/videos}}
                      {{images}}
                      <li><img src="{{ path }}" /></li>
                      {{/images}}
                  </ul>
              </div>
              <?php }else{ ?>
                <img src="{{ product.image }}" data-src="holder.js/400x400" width="100%" alt="" class="img-responsive img_prod">
              <?php } ?>
          </div>
          <div class="large-6 medium-6 small-12 columns p_l_20 m_b_20 wow fadeInUp" data-wow-delay="0.2s">
              <div class="text_products m_t_20"> 
                 <span>{{ product.price }}</span>
                 <h1>{{ product.reference }}</h1>
                 <p>{{ product.description }}</p>

                 <div class="clear"></div>
              </div> 
          </div>

          <div class="clear"></div>

          <div class="volver">
              <a class="btn_gris" href="javascript:history.back(1)"><i class="fa fa-arrow-left"></i> {{ if {session:data name="lang_code"} == 'en'}}Back{{ else }}Volver {{ endif }}</a> 
              <div class="clear"></div>
          </div>

    </section>
 </section> 
</section>

