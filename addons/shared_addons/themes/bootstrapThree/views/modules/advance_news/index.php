<section id="content" class="mtop30">
<section class="container">
<section class="one">
<section class="one">
	{{ advance_news }}
	
	<article class="blog-post layout-01">
	<div class="media-holder">	
		{{ if type == "2" }}
			<div class="quote-inner">
				<a href="{{ urlDetail }}" class="blog-post-quote">
				<h2 class="quote-text">{{ title_said }}</h2>
				</a>
				<a href="{{ urlDetail }}" class="author">{{ autor_said }}</a>
				<!-- <span class="quote-icon"></span> -->
			</div>
		{{ endif }}
		{{ if type == "3" }}
			
			<div id="owl-slider" class="owl-carousel owl-theme">
 				{{images}}
		        <div class="item"><img src="{{ path }}" /></div>
		        {{/images}}
			</div>
		{{ endif }}
		{{ if type == "4" }}
			{{ video_audio }}
		{{ endif }}
		{{ if type == "5" }}
			{{ video_audio }}
		{{ endif }}
		{{ if type == "1" }}
			<a href="{{ urlDetail }}" class="post-featured-img"><img src="{{ image }}" alt=""></a>
		{{ endif }}
	</div>
	<div class="blog-post-intro">
		<h2 class="article-title"><a href="{{ urlDetail }}">{{ title }}</a></h2>
		<ul class="meta-data">
			<li><i class=" icon-user"></i>Posted by: {{ autor }}</li>
			<li><i class=" icon-time"></i>Date: {{ date }}</li>
		</ul>
		<div class="blog-post-intro-text">
			<p>
				{{ introduction }}
			</p>
			<p>
				<a href="{{ urlDetail }}" class="read-more">Read More</a>
			</p>
		</div>
	</div>
	</article>
	{{ /advance_news }}
	{{ pagination }}

</section>

</section>
</section>
</section>