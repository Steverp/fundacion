<!-- No borrar estos divs  -->
<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="selCategory" class="hide">{{ selCategory }}</div>
<div id="page_ajax" class="hide">0</div>
<main class="products categories">
 <h1>
        <div class="container wow fadeInDown">Productos</div>
    </h1>
    <div class="myPanel wow fadeIn">
        <div class="container">
            {{intro.text}}
        </div>
    </div>
<section class="distribuitors">
                <div class="container">
                    <div class="button-group filters-button-group wow fadeIn">
                        <button class="button is-checked" data-filter="*">Todos</button>
                        {{ categories }}
                        
                        <button class="button" data-filter=".{{id}}">{{title}}</button>
                        {{ /categories }}
                    </div>
                    <div class="grid">
                        {{products}}
                        <div class="element-item {{category}} wow zoomIn">
                            <div>
                                <figure style="background-image: url({{image}})  "></figure>
                                <h3>{{name}}</h3>
                                <div class="text">
                                    {{introduction}}
                                    <a href="{{url}}" class="btn-floating waves-effect waves-light tooltipped agregar btn_home" data-position="top" data-delay="5" data-tooltip="Ver más"><i class="fa fa-plus"></i> </a>
                                </div>
                            </div>
                        </div>
                        {{/products}}
                         

                        
                    </div>
                </div>
            </section> 
</main>
