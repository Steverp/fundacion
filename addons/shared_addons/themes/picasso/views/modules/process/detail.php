<main class="detail">
    <h1><div class="wrapper">{{ proces.name }}</div><div class="icon"></div></h1>
    <div class="container">

        <div class="row">

            <div class="col s12">
                <div class="actions">
                    <!--<a href="{{ url:base }}process/add_proces_contact/{{proces.id}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Agregar a contacto"><i class="fa fa-plus"></i> </a>
                        <a class="btn-floating waves-effect waves-light tooltipped " href="" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Descargar Brochure {{ endif }}"><i class="fa fa-download"></i> </a>-->
                    <a class="btn-floating waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}"><i class="fa fa-arrow-left"></i> </a>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="col s12">
                <div class="text">{{ proces.description }}</div>
                <div class="clear"></div>
            </div>
            <!--            {{ if proces.video }}
                        <section class="myVideo">
                            <div class="container">
                                <div class="row">
                                    <div class="col s12">
                                        <video class="responsive-video" controls>
                                            <source src="{{ proces.video }}" type="video/mp4">
                                        </video>
                                    </div>
                                </div>
                            </div>
                        </section>
                        {{ endif }}-->

        </div>
    </div>

</main>
<section class="logos">
    <div class="container">
        {{ images }}
        <img src="{{ path }}" alt="" class="wow zoomIn">
        {{ /images }}
    </div>

</section>
