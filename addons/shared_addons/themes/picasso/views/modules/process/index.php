<!-- No borrar estos divs  -->
<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="selCategory" class="hide">{{ selCategory }}</div>
<div id="page_ajax" class="hide">0</div>
<main class="process">
    <h1><div class="container">{{ if lang == "es" }}Soluciones{{ else }}Solutions{{ endif }}</div><div class="icon"></div></h1>
    <div class="panel">
        <div class="container">{{ intro.text }}</div>
    </div>
    <div class="container">
        <div class="row">
            {{ process }}
            <div class="col s12 l6">
                <a href="{{ url }}">
                    <article class="card">
                        <figure>
                            <img src="{{ image }}" alt="" class="wow zoomIn">
                        </figure>

                        <h2>{{ name }}</h2>
                        <div class="text">{{ introduction }}</div>
<!--							<a href="{{ url }}" class="btn waves-effect waves-light "><i class="fa fa-plus"></i></a>-->
                    </article>
                </a>
            </div>
            {{ /process }}
        </div>
    </div>
</main>
<section class="quotes">
    <div class="container">
        <div class="text">
            {{ intro.footer }}
        </div>
    </div>
    <div class="icon">
        <i class="fa fa-quote-left"></i>
    </div>
    <div class="icon2">
        <i class="fa fa-quote-left"></i>
    </div>
</section>