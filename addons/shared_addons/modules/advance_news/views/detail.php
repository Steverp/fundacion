<section id="content" class="mtop30">
<section class="container">
<section class="one">
<section class="three-fourth">
<article class="blog-post layout-01">



<div class="media-holder">
	<div id="owl-slider" class="owl-carousel owl-theme">
		{{images}}
		<div class="item"><img src="{{ path }}" /></div>
		{{/images}}
	</div>
	
	{{ if data.type == "2" }}
		<div class="quote-inner">
			<h2 class="quote-text">{{ data.title_said }}</h2>
			{{ data.autor_said }}
			<span class="quote-icon"></span>
		</div>
	{{ endif }}
	{{ if data.type == "4" }}
		{{ data.video_audio }}
	{{ endif }}
	{{ if data.type == "5" }}
		{{ data.video_audio }}
	{{ endif }}
	{{ if data.type == "1" }}
		{{ if data.image }}
			<a href="#" class="post-featured-img"><img src="{{ data.image }}" alt="{{tittle}}" /></a>
		{{ endif }}
	{{ endif }}
</div>
<div class="blog-post-intro">
	<h2 class="article-title">{{ data.title }}</h2>
	<ul class="meta-data">

		{{if data.autor}}
		<li><i class=" icon-user"></i>{{ if {session:data name="lang_code"} == 'en'}}Posted by{{ else }}Autor{{ endif }}: {{data.autor}}</li>
		{{endif}}
		<li><i class=" icon-time"></i>{{ if {session:data name="lang_code"} == 'en'}}Date{{ else }}Fecha{{ endif }}: {{ data.date }}</li>
	</ul>
	<div class="blog-post-text">
		<p>
			{{ data.content }}
		</p>
	</div>
</div>
</article>




<div class="horizontal-line">
</div>


</section>
<section class="one-fourth last sidebar">

<div class="widget">
	<h4 class="widget-title">{{ if {session:data name="lang_code"} == 'en'}}Latest advance_news{{ else }}Últimas Noticias{{ endif }}</h4>
	<ul class="post-related">
		{{last_advance_news}}
		<li>
		<a href="{{ urlDetail }}" title="{{title}}">
		<div class="recent-post-thumb">
			<span aria-hidden="true" class="li_advance_news"></span>
		</div>
		<div class="over_title">{{title}}</div></a>
		<span class="post-date">{{ date }}</span>
		</li>
		{{/last_advance_news}}

	</ul>
</div>

</section>
</section>
</section>
</section>