<div id="baseurl" class="hide">{{ url:site }}</div>
<div id="json_markers" class="hide">{{ json_markers }}</div>
<div id="json_info_content" class="hide">{{ json_info_content }}</div>

<section class="cont_home m_b_30">
  <section class="marco">
    <!--Titulo-->
    <div class="titulos animated fadeInDown">
        <h1>Cont&aacute;ctanos</h1>
    </div>
      <div class="clear"></div>
    
    <ul class="cont_nosotros cont_contact"> 
      <li class="large-6 medium-6 small-12 columns animated fadeInUp elem_blancos">

        <?php echo form_open(site_url('contact_us/send'), 'class="crud form_contac_ajax"'); ?>       
            
           <!--<?php if ($this->session->flashdata('error')): ?>
                <div style="color: red">
                    <?php echo $this->session->flashdata('error') ?>
                </div>
            <?php endif; ?>
            <?php if ($this->session->flashdata('success')): ?>
                <div style="color: green">
                    <?php echo $this->session->flashdata('success') ?>
                </div>
            <?php endif; ?>-->            
            <div id="loading_contacts"></div>           

            <fieldset class="fila">
                <!--<label class="control-label">Nombre y apellido *</label>-->
                <input type="text" class="form-control" name="name" placeholder="Nombre y apellido *" value="<?php echo set_value('nombre') ?>">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Correo Electrónico *</label>-->
                <input type="text" class="form-control" name="email" placeholder="Correo Electrónico *" value="<?php echo set_value('correo') ?>">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Teléfono</label>-->
                <input type="text" class="form-control" name="phone" placeholder="Teléfono" value="<?php echo set_value('telefono') ?>">
            </fieldset>
           <fieldset class="fila">
                <!--<label class="control-label">Celular</label>-->
                <input type="text" class="form-control" name="cell" placeholder="Celular" value="<?php echo set_value('cell') ?>">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Empresa/Organización</label>-->
                <input type="text" class="form-control" name="company" placeholder="Empresa/Organización" value="<?php echo set_value('empresa') ?>">
            </fieldset>

            <fieldset class="fila">
                <!-- <label><span>* </span>Area </label> -->
                <?php echo form_dropdown('id_email_area', $emails_area,  set_value('id_email_area'), 'class="select_contact"'); ?>
            </fieldset>

            <!-- <fieldset class="fila">
                <label class="control-label">Municipio/Departamento</label>
                <input type="text" class="form-control" name="city" value="<?php echo set_value('municipio') ?>">
            </fieldset> -->
            <fieldset class="fila">
                <!--<label class="control-label">Mensaje *</label>-->
                <textarea class="form-control" rows="5" name="message" placeholder="Mensaje *"><?php echo set_value('mensaje') ?></textarea>
            </fieldset>
            <div align="right" class="form-group">
                <button type="submit" value="Enviar" class="btn_gris" name="btnAction">Enviar</button>  
            </div>
        <?php echo form_close(); ?>
      </li>
      <li class="large-6 medium-6 small-12 columns animated fadeInUp elem_blancos">
       
        <p>Encuéntranos </p>
        <?php echo form_dropdown('id_google_map', $selectGoogleMaps, (isset($id_google_map) ? $id_google_map : set_value('id_google_map')), 'id="changeGoogleMap"'); ?>
        
        <!-- Mapa de google -->
        <div id="map_loader"></div>
        <div id="map_wrapper">
            <div id="map_canvas" class="mapping"></div>
        </div>           

        <div>
            <h3>Datos de Contacto</h3>
            <ul>
                <li>Dirección: <?php echo (isset($contact_us->adress) ? $contact_us->adress: ''); ?></li>
                <li>Teléfono: <?php echo (isset($contact_us->phone) ? $contact_us->phone: ''); ?></li>
                <li>E-mail: <?php echo (isset($contact_us->email) ? $contact_us->email: ''); ?></li>
            </ul>
        </div>

        
      </li>

    </ul>  

 </section> 
</section>

