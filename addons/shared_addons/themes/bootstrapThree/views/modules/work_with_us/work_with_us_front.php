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

        <?php echo form_open_multipart(site_url('work_with_us/send'), 'class="crud"'); ?>       
            
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
                <input type="text" class="form-control" name="name" value="<?php echo set_value('nombre') ?>" placeholder="Nombre y Apellido*">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Correo Electrónico *</label>-->
                <input type="text" class="form-control" name="email" value="<?php echo set_value('correo') ?>" placeholder="Correo Electrónico*">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Teléfono</label>-->
                <input type="text" class="form-control" name="phone" value="<?php echo set_value('telefono') ?>" placeholder="Teléfono">
            </fieldset>
           <fieldset class="fila">
                <!--<label class="control-label">Celular</label>-->
                <input type="text" class="form-control" name="cell" value="<?php echo set_value('cell') ?>" placeholder="Celular">
            </fieldset>
            <fieldset class="fila">
                <!--<label class="control-label">Empresa/Organización</label>-->
                <input type="text" class="form-control" name="company" placeholder="Empresa/Organización" value="<?php echo set_value('empresa') ?>">
            </fieldset>
            <fieldset class="fila">
                <label class="control-label">Hoja de vida:</label>
                <?php echo form_upload('file', '', ' id="file" class="form-control" style="padding: 5px;"'); ?>
            </fieldset> 
            <fieldset class="fila">
                <!--<label class="control-label">Mensaje *</label>-->
                <textarea class="form-control" rows="5" name="message" placeholder="Mensaje*"><?php echo set_value('mensaje') ?></textarea>
            </fieldset>
            <div align="right" class="form-group">
                <button type="submit" value="Enviar" class="btn_gris" name="btnAction">Enviar</button>  
            </div>
        <?php echo form_close(); ?>
      </li>
      <li class="large-6 medium-6 small-12 columns animated fadeInUp elem_blancos">       
          <img src="{{work_with_us:image}}" alt="" class="img-responsive shadow m_b_10">
          <p>{{work_with_us:text}}</p>        
      </li>

    </ul>  

 </section> 
</section>