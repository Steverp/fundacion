<main class="gallery-detail">
    <div class="container">
        <div class="actions ">
            <h1 class="left"><div >{{ gallery.name }}</div></h1>
            <a class="btn-floating right waves-effect waves-light tooltipped " href="javascript:history.back(1)" data-position="top" data-delay="5" data-tooltip="{{ if {session:data name=" lang_code "} == 'en'}}Back{{ else }}Volver {{ endif }}"><i class="fa fa-arrow-left"></i> </a>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <?php if (count($images) > 0) { ?>
                {{images}}
                <div class="col s12 l3"> 
                    <article>
                        <a class="fancybox" rel="gallery1" href="{{ path }}" title="{{title}}">
                            <img src="{{ path }}" alt=""/>
                        </a>
                        <h3><i class="fa fa-picture-o"></i> {{title}}</h3>
                    </article>
                </div>
                {{/images}}
            <?php } else { ?>

            <?php } ?>
        </div>
    </div>
</main>
{{images}}
<div id="modal{{slug}}" class="modal">
    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat "><i class="fa fa-times-circle"></i></a>
    <div class="modal-content">
        <img src="{{ path }}" alt="{{title}}" class=""/></a>
    </div>
</div>
{{/images}}




