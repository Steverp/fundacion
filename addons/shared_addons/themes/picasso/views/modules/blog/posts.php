<?php // echo '<pre>'; var_dump($posts);                ?>
<main class="blog">
<h1>{{ theme:image file="bg_heading.png" alt="" }}<div class="wrapper">{{ if {session:data name="lang_code"} == 'en'}}Products{{ else }}Blog {{ endif }} {{ category }}</div></h1>
    <div class="container">
        <div class="row">
            
           
               {{ if posts }} 
            {{ posts }}

                
                    <div class="col l12 s12 ">


                        <article>

                            <h2>{{ title }}</h2>
                            <div class="autor "><i class="fa fa-user"></i><a>{{ created_by:display_name }}</a>
                            </div>
                            <div class="date"><i class="fa fa-calendar-o"></i><span>{{ helper:date timestamp=created_on }}</span>
                            </div>
                            {{ if category }}
                            <div class="category">
                                <i class="fa fa-bars"></i>
                                <a href="{{ url:site }}blog/category/{{ category:slug }}">{{ category:title }}</a>
                            </div>
                            {{ endif }}
<!--                            <img src="{{image:image}}" />-->
                            <div class="text"> {{ preview }}</div>
                            <a href="{{ url }}" class="btn-link"><i class="fa fa-chevron-right"></i> Ver Más</a>
                            <div class="clear"></div>
                            <div class="icon"><i class="fa fa-newspaper-o"></i> </div>
                        </article>

                   
           
       
            {{ pagination }}
            {{ /posts }}
            {{ else }}
            {{ helper:lang line="blog:currently_no_posts" }} 
            {{ endif }}
            </div>
         
      
    </div>
</main>