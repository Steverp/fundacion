<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="json_markers" class="hide">{{ json_markers }}</div>
<div id="json_info_content" class="hide">{{ json_info_content }}</div>
<main class="contact">
    <h1><div class="container wow fadeInDown">Contáctanos</div></h1>

    <div class="container ">
        <div class="center">
            <ul class="tabs">
                <li class="tab col s3"><a class="active" href="#test1">Cotizador</a></li>
                <li class="tab col s3"><a  href="#test2">Encuesta de servicio</a></li>
            </ul>
        </div>
        <div id="test1">
            <div class="row">

                <div class="col s12 l6 wow fadeInLeft">
                    <!--
                                    <p>Encuéntranos </p>
                    <?php echo form_dropdown('id_google_map', $selectGoogleMaps, (isset($id_google_map) ? $id_google_map : set_value('id_google_map')), 'id="changeGoogleMap" style="display: block;"'); ?>
                    -->
                    <div id="map_loader"></div>
                    <div id="map_wrapper">
                        <div id="map_canvas" class="mapping"></div>
                    </div>
                    <div class="contact-data">
                        <h3>Datos de Contacto</h3>
                        <ul>
                            <li>
                                <?php if ($contact_us->adress) { ?>
                                    <i class="fa fa-map-marker"></i>
                                    <?php
                                    echo (isset($contact_us->adress) ? $contact_us->adress : '');
                                }
                                ?>
                            </li>
                            <li>
                                <?php if ($contact_us->phone) { ?>
                                    <i class="fa fa-phone"></i>
                                    <?php
                                    echo (isset($contact_us->phone) ? $contact_us->phone : '');
                                }
                                ?>
                            </li>
                            <li>
                                <?php if ($contact_us->email) { ?>
                                    <i class="fa fa-envelope"></i>
                                    <?php
                                    echo (isset($contact_us->email) ? $contact_us->email : '');
                                }
                                ?>
                            </li>
                            <div class="s2"></div>
                        </ul>
                    </div>
                </div>


                <div class="col s12 l6 wow fadeInRight">
                    <div id="loading_contacts"></div>  
                    <?php echo form_open(site_url('contact_us/send'), 'class="crud form_contac_ajax"'); ?>
                    <div class="input-field ">
                        <input id="nombre" type="text" class="validate name" name="name" value="<?php echo set_value('nombre') ?>">
                        <label for="nombre">Nombre</label>
                    </div>
                    <div class="input-field ">
                        <input id="phone" type="text" class="validate phone" name="phone" value="<?php echo set_value('telefono') ?>">
                        <label for="phone">Teléfono</label>
                    </div>
                    <div class="input-field ">
                        <input id="company" type="text" class="validate company" name="company" value="<?php echo set_value('company') ?>">
                        <label for="company">Compañia</label>
                    </div>
                    <div class="input-field ">
                        <input id="city" type="text" class="validate city" name="city" value="<?php echo set_value('city') ?>">
                        <label for="city">Ciudad</label>
                    </div>
                    <div class="input-field ">
                        <input id="email" type="text" class="validate email" name="email" value="<?php echo set_value('correo') ?>">
                        <label for="email">Correo Electrónico</label>
                    </div>

                    <div class="input-field ">
                        <textarea id="textarea1" name="message" class="materialize-textarea message"></textarea>
                        <label for="textarea1">Mensaje</label>
                    </div>

                    <input type="submit" class="waves-effect waves-light btn right" name="btnAction" value="Enviar">
                    <div class="clear"></div>
                    <?php echo form_close(); ?>

                </div>
            </div>
        </div>

        <div id="test2">
            <div class="row">
                <div class="clear">&nbsp;&nbsp;</div>
                <div id="loading_contacts2"></div>
                <?php echo form_open(site_url('contact_us/quiz'), 'class="crud form_contac_ajax2"'); ?>
                <div class="col s12 l6">
                    <label for="textarea1">Lorem ipsum dolor sit amet, consectetur ¿Lorem ipsum dolor sit amet, consectetur?</label>
                    <div class="input-field ">      
                        <select style="display:block" name="id_subject" id="id_subject" class="id_subject">
                            {{ emails_area }}
                            <option value="{{ id }}">{{ title }}</option>
                            {{ /emails_area }}
                        </select>
                    </div>
                </div>
                <div class="col s12 l6">
                    <div class="input-field ">
                        <textarea id="comment" name="comment" class="materialize-textarea comment"></textarea>
                        <label for="comment">Lorem ipsum dolor sit amet, consectetur ¿Lorem ipsum dolor sit amet, consectetur?</label>
                    </div>
                    <input type="submit" class="waves-effect waves-light btn right" name="btnAction" value="Enviar">
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>




    </div>
</main>