<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="selCategory" class="hide">{{ selCategory }}</div>
<div id="page_ajax" class="hide">0</div>
<main class="projects categories">
    <h1>
        <div class="container wow fadeInDown">{{ intro:title }}</div>
    </h1>
    <div class="myPanel wow fadeIn">
        <div class="container">
            {{intro:text}}
        </div>
    </div>
    <section class="distribuitors">
        <div class="container">
            <div class="button-group filters-button-group wow fadeIn">
                <button class="button is-checked" data-filter="*">Todos</button>
                {{categories}}
                <button class="button" data-filter=".categoria{{id}}">{{title}}</button>
                {{/categories}}
            </div>
            <div class="grid">
                {{projects}}
                <div class="element-item categoria{{category}} wow zoomIn">
                    <div>
                        <figure style="background-image: url('{{image}}')"></figure>
                        <h3>{{name}}</h3>
                        <div class="text">
                            {{introduction}}
                            <a href="{{url}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Ver más"><i class="fa fa-plus"></i> </a>
                        </div>
                    </div>
                </div>
                {{/projects}}
            </div>
        </div>
    </section>
</main>