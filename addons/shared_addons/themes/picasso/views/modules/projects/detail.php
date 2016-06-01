<main class="detail">
    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="actions">
                   <h1><div class="left">{{ project.name }}</div></h1>
                   <!--  {{ if project.seefile }}
                    <a class="btn-floating waves-effect waves-light tooltipped " href="{{project.file}}" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Ficha técnica {{ endif }}"><i class="fa fa-cloud-download"></i> </a>
                    {{ endif }} -->
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}"><i class="fa fa-arrow-left"></i> </a>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="col s12">
                <article>
                    <figure style="background-image: url('{{project.image}}')" title="{{ project.name }}"></figure>
                    <div class="text">{{ project.description }}</div>
                    <div class="clear"></div>
                </article>
                <div class="clear"></div>
            </div>
        </div>
    </div>



<section>
    <div class="container">
        <div class="row">
            <div class="col l6">
                <div class="list-detail">
                    <h2>Caracteristicas Generales</h2>
                    <ul>
                        <li><i class="fa fa-circle-o-notch"></i> Apartamento castilla</li>
                        <li><i class="fa fa-circle-o-notch"></i> Apartamento teusaquillo</li>
                        <li><i class="fa fa-circle-o-notch"></i> Apartamento castilla</li>
                        <li><i class="fa fa-circle-o-notch"></i> Apartamento teusaquillo</li>
                        <li><i class="fa fa-circle-o-notch"></i> Apartamento castilla</li>
                    </ul>
                </div>
            </div>


            <div class="col l6">
                <div class="list-detail">
                    <h2>Beneficios</h2>
                    <p><i class="fa fa-circle-o-notch"></i> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores ducimus consectetur eius, adipisci officia labore enim, delectus quasi aliquam debitis perspiciatis harum, dignissimos ipsam culpa cum pariatur unde excepturi explicabo.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
</section>

<section class="gallery-images">

                <div class="container">
                    <h2>Galeria de imagenes</h2>
                    <div class="row">
                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/img02.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/img02.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div>

                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/img01.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/img01.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div> 


                        <div class="col l4">
                            
                            <div class="image">
                                <figure style="background-image:url(addons/shared_addons/themes/picasso/img/img02.jpg)"></figure> 
                            
                                 <a href="addons/shared_addons/themes/picasso/img/img02.jpg" class="fancyboxg fondo" rel="s" ><i class="fa fa-search-plus"></i></a>
                            </div>
                            
                        </div>                        

                       





                    </div>

                </div>
            </section>

</main>