<!-- No borrar estos divs  -->
<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="page_ajax" class="hide">0</div>
<main class="services categories">
    <h1><div class="container wow fadeInDown">{{ intro:title }}</div></h1>
    <div class="myPanel wow fadeIn"><div class="container">{{ intro:text }}</div></div>
    <div class="container">

        <div class="row">
            <div class="col s12 l12">
                {{ if servicesdest }}
                <div class="row servicios_item" id="upload_items">
                    {{ servicesdest }}
                    <div class="col s12 l6">
                        <article class="card wow zoomIn">
                            <figure class="activator " style="background-image: url('{{image}}') ">
                            </figure>
                            <div class="card-content">
                                <h2 class="activator ">{{ name }} </h2>
                                <div class="text"> {{ introduction }}</div>
                            </div>
                            <div class="actions">
                                <a class="activator btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Ver más"><i class="fa fa-plus"></i> </a>
                                <div class="clear"></div>
                            </div>
                            <div class="card-reveal">
                                <div class="card-title"><i class="fa fa-close right"></i></div>
                                <div class="text">{{ description }}</div>
                                {{ if seefile }}
                                <a href="{{file}}" class="btn">Descargar</a>
                                {{ endif }}
                            </div>
                        </article>
                    </div>
                    {{ /servicesdest }}
                    {{ endif }}
                    {{ if services }}
                    {{ services }}
                    <div class="col s12 l4">
                        <article class="card wow zoomIn">
                            <figure class="activator " style="background-image: url('{{image}}') ">
                            </figure>
                            <div class="card-content">
                                <h2 class="activator ">{{ name }} </h2>
                                <div class="text"> {{ introduction }}</div>
                            </div>
                            <div class="actions">

                                <a class="activator btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Ver más"><i class="fa fa-plus"></i> </a>
                                <div class="clear"></div>
                            </div>
                            <div class="card-reveal">
                                <div class="card-title"><i class="fa fa-close right"></i></div>
                                <div class="text">{{ description }}</div>
                                {{ if seefile }}
                                <a href="{{file}}" class="btn">Descargar</a>
                                {{ endif }}
                            </div>
                        </article>
                    </div>
                    {{ /services }}
                    {{ endif }}
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</main>