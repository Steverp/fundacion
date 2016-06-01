<main class="workTeam ">
    <h1><div class="container wow fadeInDown">{{ intro:title }}</div></h1>
    <div class="myPanel">
        <div class="container">
            {{intro:intro}}
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col s12 l8">
                <figure class="img-top" style="background-image: url('{{ intro:image }}')">
                </figure>
                <div class="text">
                    {{ intro:text }}
                </div>
            </div>
            <div class="col s12 l4">
                <div class="panel ">
                    <div class="container">
                        {{customers}}
                        <h4 class="wow fadeIn">{{link}}</h4>
                        <div class="text wow fadeIn">{{image}}</div>
                        {{/customers}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{ if partners }}
    <section class="carousel1 hide">
        <div class="container relative">
            <div class="row">
                <div class="col s12">
                    <h2>{{ intro:title2 }}</h2>
                </div>
                
                <div class="col s12  l12">
                    <div class="container-responsive">
                        <div class="" id="carousel">
                            {{ partners }}
                            <div>
                                <a href="{{link}}" target="_blank">
                                    <figure><img src="{{image}}" alt="escala urbana">
                                    </figure>
                                </a>
                            </div>
                            {{ /partners }}
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    {{ endif }}
    {{ if work_team }}
    <section class="carousel3 hide">
        <div class="container relative">
            <div class="row">
                <div class="col s12">
                    <h2>{{ intro:title3 }}</h2>
                </div>
                
                <div class="col s12  l12">
                    <div class="container">
                        <div class="" id="carousel">
                            {{ work_team }}
                            <div>
                                <a href="{{link}}" target="_blank">	
                                    <figure><img src="{{ image }}" alt="escala urbana">
                                    </figure>
                                </a>
                            </div>
                            {{ /work_team }}
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    {{ endif }}
</main>