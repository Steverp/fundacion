{{ if gallerys }} {{ gallerys }}
<div class="item-gallery">
	<div class="over"></div>
	<div class="icon"><i class="fa fa-picture-o"></i>
	</div>
	<a class="fancybox" href="{{ url }}" data-fancybox-group="gallery" title="{{ name }}">
		<img src="{{ image }}" alt="{{ name }}" />
		<h3>{{name}}</h3>
	</a>
</div>
{{ /gallerys }} {{ else }}
<div class="col-sm-12 col-md12" id="stop_scroll">
	<p style="text-align:center;margin-top:80px"><strong>{{ if {session:data name="lang_code"} == 'en'}}No results were found{{ else }}No se encontraron resultados {{ endif }}...</strong>
	</p>
</div>
{{ endif }}