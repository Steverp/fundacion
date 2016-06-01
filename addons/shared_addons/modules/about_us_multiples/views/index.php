<div class="container_body">

<div class="row">

	<!-- TITULO -->

	<div class="col-sx-12 col-sm-12 col-md-12 col-lg-12">

		<br />
        <div class="row">
    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><div class="points">&nbsp;</div></div>
    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><h1>Nosotros</h1></div>
    	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"><div class="points">&nbsp;</div></div>
        </div>

	</div>

	<br>

</div>



<div class="container-fluid">

	{{ about_us_multiples }}

	<div class="row nos_des2">

		<div class="col-lg-3 col-md-3 col-sm-3 col-sx-12">

			<div class="cont-img-blog pic_qs">

				<img src="{{ image }}" alt="">

			</div>

		</div>

		<div class="col-lg-9 col-md-9 col-sm-9 col-sx-12">

			<h2><!--<a href="{{ urlDetail }}">-->{{ title }}<!--</a>--></h2>

			<p>{{ content }}</p>

			<!--<span class="post-date tx-al-ri">{{ date }}</span>-->

		</div>

	</div>

	<hr style="border-top:#B6B6B6 solid 1px; margin:25px 0;" />

	{{ /about_us_multiples }}

	{{ pagination }}

</div>

</div>



