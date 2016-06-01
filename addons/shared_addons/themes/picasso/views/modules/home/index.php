<section class="banner wow fadeIn">
    <div class="icon wow bounceInRight "></div>
    {{ if banner }}
    <div class="bxslider">
        {{ banner }}
        <div class="mySlide" style="background-image: url('{{image}}')">
            <div class="container relative">
             
                <div class="caption">

                    <div class="prev"><i class="fa fa-chevron-up"></i>
                    </div>
                    <div class="next"><i class="fa fa-chevron-down"></i>
                    </div>
                    
                    <h2>{{title}}</h2>
                    <p>{{ text }}</p>
                    <div class="text">
                        {{solution}}
                    </div>
                    <div class="actions">
                        {{ if link }}
                        <a href="{{link}}" class="btn btn-large waves-effect waves-light">Ver más</a>
                        {{ endif }}
                        <!--<a href="{{ linki:linkbanner }}" class="btn-link">{{ linki:titlelinkbanner }}</a>-->
                    </div>
                </div>
            </div>
        </div>
        {{ /banner }}
    </div>
    {{ endif }}
</section>
<section class="logos">
    <div class="container">
        <a>{{ linkintro:title }}</a>
        <img src="{{ linkintro:logo }}" alt="" class="wow zoomIn">
        <div class="actions">
            {{links}}
            <a href="{{link}}" class="btn-link wow fadeIn">
                <i class="fa fa-circle-thin"></i>{{title}}
            </a>
            {{/links}}
        </div>
    </div>
</section>

<section class="video " >

        <div class="parallax" style="background-image:url('{{ video:image }}')">
        </div>

        <div class="capa">
            <div class="container">
                <h1 class="wow fadeInDown">{{ video:title }}</h1>
                <div class="text wow fadeInUp">
                    <p>{{ video:text }}</p>
                </div>
                <a href="#modal1" class="modal-trigger hide"><i class="fa fa-play-circle-o wow bounceInDown"></i></a>

            </div>
        </div>
    
</section>
<div id="modal1" class="modal">

    <div class="modal-content">
        <a href="#!" class=" modal-action modal-close btn-floating waves-effect waves-light"><i class="fa fa-times"></i></a>
        <video width="400" controls>
            <source src="{{ video:video }}" type="video/mp4">
        </video>
    </div>

</div>
<section class="areas">
    <div class="container">
        <div class="row">
            <h2 class="wow fadeInDown">{{ video:title1 }}</h2> 
            {{ numbers }}
            <div class="col s12 l12 ">
                <article class=" waves-effect waves-light wow">
                    <div class="col s12 l5">
                        <figure title="{{title}}" style="background-image: url('{{ image }}')">
                        </figure>
                    </div>
                    <div class="col s12 l7">
                        <h3>{{title}}</h3>

                        <p>{{ text }}</p>
                        <a href="{{link}}" class="btn-link" target="_blank"><i class="fa fa-angle-double-right"></i>{{ if lang == "es" }}Ver más{{ else }}more{{ endif }} </a>
                    </div>
                </article>
                <div class="icon"><i class="fa fa-archive"></i>
                </div>
            </div>
            {{ /numbers }}
        </div>
    </div>
</section>
<section class="carousel " >
    <div class="container relative">
        <div class="row">
            <div class="col s12">
                <h2>{{ video:clientes }}</h2>
            </div>
            <div class="col s12  l12">
                <div class="container-responsive">
                    <div class="" id="carousel">
                        {{ people }}
                        <div class="wow zoomIn">
                            	<figure>
                            	<img src="{{ image }}" alt="{{title}}">
                            </figure>
                            <h3>{{ title }}</h3>
                            <!-- <div class="text">
                                {{ text }}
                            </div> -->
                        </div>
                        {{ /people }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="carousel2 {{destsections}}">
    <div class="container relative">
        <div class="row">
            <div class="col s12">
                <h2><strong>Testimonios</strong></h2>
            </div>
            <div class="col s12  l12">
                <div class="container-responsive">
                    <div class="" id="carousel">
                        <div class="wow zoomIn">
                            <div class="text">
                                <i class="fa fa-quote-left"></i>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio explicabo similique numquam sit placeat mollitia neque quos, consequuntur, eius quasi soluta ipsam culpa ab suscipit, accusantium perferendis quaerat aperiam veniam.
                                <i class="fa fa-quote-right"></i>
                            </div>
                            <h3>{{ destacado:title }}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

