<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->
    <div class="subtittle titulo_int animated fadeInDown">
        <h1>{{ data.title }}</h1>	     
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros detalle_not">

    	<div class="large-12 medium-12 small-12 columns wow fadeInUp">		        	
	    	<div class="img_detalle">
	        	<img src="{{ data.image }}" alt="{{tittle}}">
	       	</div>
			{{if data.autor}}
				<h5><b>Autor:</b> <i>{{data.autor}}</i></h5>
			{{endif}}
			<b class="date_detail">{{ data.date }}</b>
	        <p>{{ data.content }}</p>
	        <!-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
				<div class="news-posts">
					<h3>{{ if {session:data name="lang_code"} == 'en'}}Latest news{{ else }}Últimas Noticias {{ endif }}</h3>
					<ul>
						{{last_news}}
							<li>{{title}}...</li>
						{{/last_news}}
					</ul>
				</div>
				<div class="news-comments">
					<h3>{{ if {session:data name="lang_code"} == 'en'}}Latest Comments{{ else }}Últimos Comentarios {{ endif }}</h3>
					<ul>
						{{last_comments}}
							<li>{{comment}}...</li>
							<hr>
						{{/last_comments}}
					</ul>
				</div>
			</div> -->
	    </div>

	    <div class="clear"></div>
		
		<div class="large-12 medium-12 small-12 columns wow fadeInUp m_t_20">
			<div id="comments"  class="panel panel-info mtop20">
				<div class="panel-heading">
					<h3><i class="fa fa-comments-o"></i> {{ if {session:data name="lang_code"} == 'en'}}Comments {{ else }}Comentarios {{ endif }}</h3>
				</div>
				<div style="margin-bottom: 20px;" class="res_form">
					<div class="row">
						
						<div class="large-12 medium-12 small-12">
							{{ news_comments }}
							<div class="comment">
								<h4><span>{{email}}</span> - <span>{{name}}</span></h4>
								<div class="news_comment">
									{{ comment }}
								</div>
								<div class="clear"></div>
								<hr>
							</div>
							{{ /news_comments }}
						</div>
						<div class="large-12 medium-12 small-12">
							<P>{{ if {session:data name="lang_code"} == 'en'}}Write a comment {{ else }}Escribir un comentario {{ endif }}</P>
						</div>

						<div id="commentPost" class="">
							<?php echo form_open(site_url('news/insert_comment/'.$data->id.'/'.$data->slug), 'class="crud form_reservations elem_blancos"'); ?>
								<?php if ( ! is_logged_in()): ?>
								
								<div class="row">
									<div class="form-group col-md-6">
										<!-- <label for="name">Nombre<span class="required">*</span>:</label> -->
										<?php echo form_input('name', set_value('name'), 'class="form-control " placeholder="Nombre *" maxlength="100"'); ?>
										<!--<input type="text" name="name" id="name"  placeholder="Nombre *" value="">-->
									</div>
									<div class="form-group col-md-6">
										<!-- <label for="email">E-mail<span class="required">*</span>:</label> -->
										<?php echo form_input('email', set_value('email'), 'class="form-control " placeholder="Correo Electrónico *" maxlength="100"'); ?>
										<!--<input type="text" name="email" maxlength="40" placeholder="E-mail *" value="">-->
									</div>
								</div>
								<?php endif ?>
								
								
								<div class="form-group">
									<!-- <label for="comment">Mensaje<span class="required">*</span>: </label><br> -->
									<?php echo form_textarea('comment', set_value('comment'),'class="form-control" rows="5" cols="30" placeholder="Mensaje *"'); ?>
									<!--<textarea name="comment" id="comment" rows="5" placeholder="Mensaje *" cols="30" class="width-full"></textarea>-->
								</div>

								<div class="form_submit">
									<input type="submit" name="btnAction" value="Comentar" class="btn_gris right">
								</div>
							<?php echo form_close(); ?>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="clear"></div>

		<div class="volver">
			<a class="btn_gris" href="javascript:history.back(1)">
				<i class="fa fa-angle-double-left"></i> {{ if {session:data name="lang_code"} == 'en'}}Back{{ else }}Volver {{ endif }}				  
			</a>
			<div class="clear"></div>
		</div>
    	
    </section>
 </section> 
</section>


