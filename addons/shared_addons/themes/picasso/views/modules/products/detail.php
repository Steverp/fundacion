<main class="detail">
    
    <div class="container">
        <div class="row">

            <div class="col s12">
                <div class="actions">
                    
        <h1><div class="left">Lorem ipsum </div></h1>
<!--
                    <a href="{{ url:base }}products/add_product_contact/{{product.id}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Agregar producto al contacto"><i class="fa fa-plus"></i> </a>
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Ficha técnica {{ endif }}"><i class="fa fa-cloud-download"></i> </a>
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Cátalogo {{ endif }}"><i class="fa fa-download"></i> </a>
-->
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}"><i class="fa fa-arrow-left"></i> </a>
                    <div class="clear"></div>
                </div>

            </div>
            <div class="col s12">
                <figure>
                    <div class="price"><i class="fa fa-usd"></i> 34.000</div>
                    <?php if (count($images) > 0) { ?> {{images}}
                        <a class="fancybox-thumb" rel="fancybox-thumb" href="{{ path }}" title="{{ product.name }}">
                            <img src="{{ path }}" alt="{{ product.name }}" />
                            <span class="icon tooltipped" data-position="top" data-delay="5" data-tooltip="Clic para ver más imagenes"><i class="fa fa-picture-o"></i></span>
                        </a>
                        {{/images}}
                    <?php } else { ?>
                        <img src="{{product.image }}" alt="{{ product.name }}">
                    <?php } ?>
                </figure>
                <div class="text">{{ product.description }}</div>
                <div class="clear"></div>
            </div>

        </div>
    </div>
</div>

<section class="gallery-images">

                <div class="container">
                    <h2>Galeria de imagenes</h2>
                    <div class="row">
                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/cold.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/cold.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div>

                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/cold1.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/cold1.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div> 


                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/cold2.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/cold2.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div>                        

                       





                    </div>

                </div>
            </section>





    <section>
    <div class="container">
        <div class="row">
            <div class="col l6">
                <div class="list-detail">
                    <h2>Caracteristicas Generales</h2>
                    <ul>
                        <li><i class="fa fa-spinner"></i> Lorem ipsum dolor sit, eveniet!</li>
                        <li><i class="fa fa-spinner"></i> Lorem ipsum dolor situptate!</li>
                        <li><i class="fa fa-spinner"></i> Lorem ipsum dolor sitratione voluptate.</li>
                        <li><i class="fa fa-spinner"></i> Lorem ipsum dolor sit similique.</li>
                        <li><i class="fa fa-spinner"></i> Lorem ipsum dolor sit.</li>
                    </ul>
                </div>
            </div>


            <div class="col l6">
                <div class="list-detail">
                    <h2>Beneficios</h2>
                    <p><i class="fa fa-spinner"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores ducimus consectetur eius, adipisci officia labore enim, delectus quasi aliquam debitis perspiciatis harum, dignissimos ipsam culpa cum pariatur unde excepturi explicabo.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
</section>



</main>
