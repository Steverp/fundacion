<section class="title">

    <h4>Noticias</h4>

    <br>

    <small class="text-help">Los campos señalados con <span>*</span> son obligatorios.</small>

</section>



<section class="item">

    <div class="content">

        <div class="tabs">

            <ul class="tab-menu">

                <li><a href="#page-advance_news"><span><?php echo $titulo; ?></span></a></li>

            </ul>



            <div class="form_inputs" id="page-advance_news">

                <?php echo form_open_multipart(site_url('admin/advance_news/edit_advance_new/'.(isset($datosForm) ? $datosForm->id : '0').'/'.$lang_admin), 'id="form-wysiwyg"'); ?>

                <div class="inline-form">

                    <fieldset>

                        <ul>

                        	<li>

	                            <label for="path">Tipo</label>

								<?php echo form_dropdown('type', $selecttype, (isset($datosForm->type)) ? $datosForm->type : set_value('autor'), 'id="type"'); ?>

	                        </li>

	                        <li id="type_texto" class="type_sel">

	                            <label for="title">Texto<span>*</span></label>

	                            <div class="input"><?php echo form_input('title_said', (isset($datosForm->title_said)) ? $datosForm->title_said : set_value('title_said'), 'class="dev-input-title"'); ?></div>

	                        </li>

							<li id="type_texto2" class="type_sel">

	                            <label for="title">Autor Texto</label>

	                            <div class="input"><?php echo form_input('autor_said', (isset($datosForm->autor_said)) ? $datosForm->autor_said : set_value('autor_said'), 'class="dev-input-title"'); ?></div>

	                        </li>

	                        <li id="type_iframe" class="type_sel">

	                            <label for="introduction">Iframe

	                                <small class="counter-text">Debes insertar el html del iframe del video o audio</small>

	                            </label>

	                            <div class="input"><?php echo form_textarea('video_audio', (isset($datosForm->video_audio)) ? $datosForm->video_audio : set_value('video_audio'),'class="dev-input-textarea limit-text" length="600" maxlength="600"'); ?></div>

	                        </li>

                            <li id="type_imagen" class="type_sel">

                                <label for="name">Imagen

                                    <small>

                                        - Imagen Permitidas gif | jpg | png | jpeg<br>

                                    </small>

                                </label>

                                <div class="input">

                                 <?php if (!empty($datosForm->image)): ?>

                                    <div>

                                        <img src="<?php echo site_url($datosForm->image) ?>" width="298">

                                    </div>

                                <?php endif; ?>

                                <div class="btn-false">

                                    <div class="btn">Examinar</div>

                                    <?php echo form_upload('image', '', ' id="image"'); ?>

                                </div>

                            </div>

                            <br class="clear">

                        </li>

                        

                        <li>

                            <label for="title">Titulo <span>*</span></label>

                            <div class="input"><?php echo form_input('title', (isset($datosForm->title)) ? $datosForm->title : set_value('title'), 'class="dev-input-title"'); ?></div>

                        </li>

						<li>

                            <label for="title">Autor Noticia</label>

                            <div class="input"><?php echo form_input('autor', (isset($datosForm->autor)) ? $datosForm->autor : set_value('autor'), 'class="dev-input-title"'); ?></div>

                        </li>

                        <li class="even">

                            <label for="name">

                                Contenido

                                <span>*</span>

                                <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>

                            </label>

                            <div class="input">

                                <div class="sroll-table">

                                    <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => (isset($datosForm->content)) ? $datosForm->content : set_value('content'), 'rows' => 30, 'class' => 'wysiwyg-advanced')) ?>

                                    <input type="hidden" name="content" id="text">

                                </div>

                            </div>

                            <br class="clear">

                        </li>



                        <li>

                            <label for="introduction">Introducción

                                <span>*</span>

                                <small class="counter-text"></small>

                            </label>

                            <div class="input"><?php echo form_textarea('introduction', (isset($datosForm->introduction)) ? $datosForm->introduction : set_value('introduction'),'class="dev-input-textarea limit-text" length="600" maxlength="600"'); ?></div>

                        </li>



                        <?php if($ban): ?>

                            <li>

                                <label for="name">Orden / Posición</label>

                                <div class="input">

                                    <select name="position_advance_new">

                                        <?php $i = 1; ?>

                                        <?php foreach ($positionadvance_news as $position): ?>

                                            <option value="<?php echo $position->id ?>" <?php echo ($datosForm->position == $position->position) ? 'selected="selected"' : null ?>><?php echo $i; ?></option>

                                            <?php $i++; ?>

                                        <?php endforeach; ?>

                                    </select>

                                </div>

                            </li>



                            <li>

                                <label for="name">Fecha de Publicación</label>

                                <div class="input">
                                    <input type="text" id="publish_date" name="date" value="<?php echo $datosForm->date; ?>" >
                                    <!--<p><?php echo fecha_spanish_full($datosForm->date) ?></p>-->

                                </div>

                            </li>

                            <?php

                            echo form_hidden('position_current', $datosForm->position);

                            endif;

                            ?>



                        </ul>

                        <?php

                        $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));

                        ?>

                    </fieldset>

                </div>

                <?php echo form_close(); ?>

            </div>

            

        </div>

    </div>

</section>

<script>

    $(document).ready(function(){

        $('#publish_date').datepicker({ 
            minDate: 0,
            dateFormat: 'yy-mm-dd'
        });

		function esconder(tipo)

		{

			$('.type_sel').addClass('hide');

			switch (parseInt(tipo)) {

			    case 1:

			    $('#type_imagen').removeClass('hide');

			        break;

			    case 2:

			    $('#type_texto').removeClass('hide');

			    $('#type_texto2').removeClass('hide');

			        break;

			    case 4:

			    $('#type_iframe').removeClass('hide');

			        break;

			    case 5:

			    $('#type_iframe').removeClass('hide');

			        break;

			}

		}

		esconder($("#type").val());

        $("#type").change(function ()

        {

            tipo = $(this).val();

            esconder(tipo);

        });

    });

</script>

