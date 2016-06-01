<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="page_ajax" class="hide">0</div>
<main class="gallery categories">
    <h1><div class="container">{{ intro:title }}</div></h1>
    <div class="panel">
        <div class="container">
            {{ intro:text }}
        </div>
    </div>
    <div class=" container">
        
        <section class="distribuitors ">
            <div class="button-group filters-button-group wow fadeIn">
                <button class="button is-checked" data-filter="*">Todos</button>
                {{categories}}
                <button class="button" data-filter=".categoria{{id}}">{{title}}</button>
                {{/categories}}
            </div>
            <div class="grid">
                {{gallerys}}
                <div class="element-item categoria{{category}} wow zoomIn">
                    <div>
                        <figure style="background-image: url('{{image}}')"></figure>
                        <h3>{{name}}</h3>
                        <span class="date"><i class="fa fa-calendar"></i> {{ date }}</span>
                        <div class="text ">
                            {{intro}}
                            <a href="{{url}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Ver más"><i class="fa fa-plus"></i> </a>
                        </div>
                    </div>
                </div>
                {{/gallerys}}
            </div>
        </section>
    </div>
</main>