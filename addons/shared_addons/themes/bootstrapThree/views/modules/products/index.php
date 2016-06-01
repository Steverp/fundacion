<script>
    $(function () {
        $("ul.level_2 li ul.level_3 li.subcategory").each(function () {
            var id_control = $(this).parent().parent().get(0).id;
            // console.log(id_control);
            var control_edit = $(".level_2 li#" + id_control);
            //control_edit.css("background","#F00");
            // control_edit.append('<span class="more_items" id="' + id_control + '">+</span>');
        });
        $("span.more_items").click(function () {
            var id_sub_cat = $(this).attr("id");
            //$("li#"+id_sub_cat+" ul.level_3").css("display","block");
            if (!$("li#" + id_sub_cat + " ul.sub_" + id_sub_cat).is(":visible")) {
                //console.log("not Visible");
                $("li#" + id_sub_cat + " ul.sub_" + id_sub_cat).slideDown();
            } else {
                //console.log("Visible");
                $("li#" + id_sub_cat + " ul.sub_" + id_sub_cat).slideUp();
            }
        });
        $(".list-group-item").click(function (ev) {
            var target = $(ev.target);
            if (target.not('.list-group-item a,span.more_items').length) {
                var cat = $(this).attr("id");
                // console.log(cat);
                if (cat == "todos") {
                    $(".level_2").slideDown();
                    $(".ico-more").html("");
                }
                if (!$(".sub_" + cat).is(":visible")) {
                    $("#" + cat + " .ico-more").html("<i class='fa fa-angle-double-right'></i>");
                    $(".sub_" + cat).slideDown();
                } else {
                    $("#" + cat + " .ico-more").html("<i class='fa fa-angle-double-down'></i>");
                    $(".sub_" + cat).slideUp();
                }
            }
        });

        if ($(".list_categ_lis ul.list-group li ul li").hasClass("class_active")) {
            $("li.class_active").parent().addClass("open");
        }
        ;

        if ($(".list_categ_lis ul.list-group li ul li ul li").hasClass("class_active")) {
            $("li.class_active").parent().parent().parent().addClass("open");
        }
        ;

        if ($(".list_categ_lis ul.list-group li ul li ul li ul li").hasClass("class_active")) {
            $("li.class_active").parent().parent().parent().parent().parent().addClass("open");
        }
        ;
        if ($(".list_categ_lis ul.list-group li ul li ul li ul li ul li").hasClass("class_active")) {
            $("li.class_active").parent().parent().parent().parent().parent().parent().parent().addClass("open");
        }
        ;

    });
    /*eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('$(b(){$("6.e 3 6.A 3.C").B(b(){5 8=$(k).q().q().D(0).7;n.p(8);5 r=$(".e 3#"+8);r.H(\'<c E="i" 7="\'+8+\'">+</c>\')});$("c.i").t(b(){5 2=$(k).u("7");9(!$("3#"+2+" 6.4"+2).o(":m")){$("3#"+2+" 6.4"+2).d()}l{$("3#"+2+" 6.4"+2).v()}});$(".y-w-x").t(b(s){5 j=$(s.j);9(j.F(\'.y-w-x a,c.i\').z){5 1=$(k).u("7");n.p(1);9(1=="G"){$(".e").d();$(".f-g").h("-")}9(!$(".4"+1).o(":m")){$("#"+1+" .f-g").h("-");$(".4"+1).d()}l{$("#"+1+" .f-g").h("+");$(".4"+1).v()}}})});',44,44,'|cat|id_sub_cat|li|sub_|var|ul|id|id_control|if||function|span|slideDown|level_2|ico|more|html|more_items|target|this|else|visible|console|is|log|parent|control_edit|ev|click|attr|slideUp|group|item|list|length|level_3|each|subcategory|get|class|not|todos|append'.split('|'),0,{}))*/
</script>
<?php

function build_categories($rows, $module = null, $parent = 0, $ban = true, $current = null, $slugFather = '', $level = 1, $selCategory = null) {
    $classCategories = 'category';
    $classSubcategoriesFather = 'subcategoriFather';
    $classSubcategories = 'subcategory';
    $plusClass = 'plus';
    $classActive = 'class_active';

    $result = "<ul " . (!empty($slugFather) ? 'class="level_' . $level . ' sub_' . $slugFather . '"' : 'class="list-group"') . ">";
    if ($ban)
        $result.= "<li id='todos' class='list-group-item'><a href='{$module}'><i class='fa fa-list-ul'></i> Todos</a></li>";
    foreach ($rows as $row) {
        if ($row->parent == $parent) {
            foreach ($rows as $subrow) {
                if ($subrow->parent == $row->id)
                    $children = true;
                else
                    $children = false;
            }
            $result.= "<li id='" . $row->slug . '_' . $row->id . "' class='" . ($children ? $plusClass : '') . ' ' . ($row->parent == 0 ? $classCategories : ($children ? $classSubcategoriesFather : $classSubcategories)) . ' ' . ($row->slug == $selCategory ? $classActive : '') . ($level < 2 ? ' list-group-item' : '') . " '>
				<a href='{$module}/index/" . $row->slug . "'>" . $row->title . "</a>";
            if ($children = true) {
                $result .= "<div class='ico-more'><i class='fa fa-angle-double-down'></i></div>";
                $result.= build_categories($rows, $module, $row->id, false, $current, $row->slug . '_' . $row->id, $level + 1, $selCategory) . "</li>";
            }
        }
    }
    $result .= "</ul>";
    return $result;
}

$menu = build_categories($categories, 'products', 0, true, $current, '', 1, $selCategory);
?>

<!-- No borrar estos divs  -->
<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="selCategory" class="hide">{{ selCategory }}</div>
<div id="page_ajax" class="hide">0</div>


<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->      
      <div class="marco">
        <div class="titulos">
            <h1>{{ if {session:data name="lang_code"} == 'en'}}Products{{ else }}Productos {{ endif }} {{ category }}</h1>
        </div>
          <div class="clear"></div>
      </div>
    <!--Fin Titulo-->  
      <div class="clear"></div>
    <section class="cont_inter marco">

    	<div class="text_introduc m_b_20">
    	    <p>{{ intro.text }} </p>
      	</div>
        
        <div class="clear"></div>


        <div class="large-3 medium-3 small-12 columns list_categ_lis">
	        <?php echo $menu; ?>
	    </div>

	    <div class="large-9 medium-9 small-12 columns padding_l">

            {{ if products }}
            <ul class="clearfix servicios_item" id="upload_items">
                {{ products }}
                <li class="large-4 medium-4 small-12 columns wow flipInX">
                  <a href="{{ url }}">
                    <div class="marco_prod">      
                    	<!-- <span class="precio"><b>{{ price }}</b></span>                         -->
                        <div class="prod_img">
                            <img src="{{image}}" alt="{{title}}" />
                        </div>                              
                        <div class="text_serv">
                            <p>{{ introduction }}</p>
                        </div>                        
                        <div class="vermas_prd">                        	
                        	<h3>{{ name }}</h3>
                        	<span>:: Ver más ::</span>
                        </div>
                    </div>  
                  </a>
                </li>
                {{ /products }}
                <div class="clear"></div>
            </ul>
	        
	        <div class="clear"></div>

	        <div class="ajax_loading" id="ajax_loading" style="display:none;">
	        	<img src="{{ url:site }}uploads/default/AjaxLoader.gif" width="28" height="28"/>
	        </div>
	        
	        {{ else }}
	        <div class="large-12 medium-12 small-12 columns" id="stop_scroll">
	            <p class="results"><strong>No se encontraron resultados...</strong></p>
	        </div>
            {{ endif }}
	    </div>
            <div class="clear"></div>
      
    </section>
 </section> 
</section>
