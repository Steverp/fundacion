<main class="blogDetail">
  <h1>{{ title }}</h1>
   <div class="container">
   <div class="row">
    {{ post }}
    <div class="col s12 l10">
        <article>
            <h2>{{ title }}</h2>
            <div class="autor "><i class="fa fa-user"></i><a>{{ created_by:display_name }}</a>
            </div>
            <div class="date"><i class="fa fa-calendar-o"></i><span>{{ helper:date timestamp=created_on }}</span></div>
            {{ if category }}
            <div class="category">
                <i class="fa fa-bars"></i>
                <a href="{{ url:site }}blog/category/{{ category:slug }}">{{ category:title }}</a>
            </div>
            {{ endif }}
            <figure>
					{{image.img}}
     </figure>
            <div class="text"> {{ body }}</div>
            <div class="clear"></div>
        </article>
        </div>
         <div class="col s12 l2">
     					<aside>
            <a class="" href="javascript:history.back(1)">
                <i class="fa fa-chevron-left"></i> Volver
            </a> {{ if keywords }}
            <div class="keywords">
                <h3>Palabras clave:</h3> {{ keywords }}
                <a href="{{ url:site }}blog/tagged/{{ keyword }}">{{ keyword }}</a> {{ /keywords }}
            </div>
            </aside>
    </div>
    {{ endif }}


{{ /post }}

</div>
<div class="clear"></div>
<?php if (Settings::get('enable_comments')): ?>
    <div class="">
        <div id="comments" class="myComments">

            <h2><?php echo lang('comments:title') ?></h2>

            <div id="existing-comments" class="">
                <?php echo $this->comments->display() ?>
            </div>
            <?php if ($form_display): ?>
                <?php echo $this->comments->form() ?>
            <?php else: ?>
                <?php echo sprintf(lang('blog:disabled_after'), strtolower(lang('global:duration:' . str_replace(' ', '-', $post[0]['comments_enabled'])))) ?>
            <?php endif ?>
        </div>
    </div>
<?php endif ?>

</div>

</main>