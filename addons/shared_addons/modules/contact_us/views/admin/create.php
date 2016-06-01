<section class="title">
    <h4>Mapas de google</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-google_map"><span>Nuevo</span></a></li>
            </ul>
            <div class="form_inputs" id="page-google_map">
                <?php echo form_open_multipart(site_url('admin/contact_us/store/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Imagen
                                    <small>
                                        - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('image', '', ' id="image"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title">Dirección <span>*</span></label>
                                <div class="input"><?php echo form_input('adress', set_value('adress'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Nombre <span>*</span></label>
                                <div class="input"><?php echo form_input('name', set_value('name'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li class="hide">
                                <label for="path">Categorias</label>
                                <select name="categories[]" multiple>
                                    <option value="1" selected >Seleccione una Opción</option>
                                </select>
                            </li>
                            <li>
                                <label for="introduction">Descripción
                                    <span>*</span>
                                    <small class="counter-text"></small>
                                </label>
                                <div class="input"><?php echo form_textarea('description', set_value('description'), 'class="dev-input-textarea limit-text"'); ?></div>
                            </li>
                            <li class="even">
                                <label for="name">
                                    Horario
                                    <span>*</span>
                                </label>
                                <div class="input"><?php echo form_textarea('schedule', set_value('schedule'), 'class="dev-input-textarea limit-text"'); ?></div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title">Mapa</label>
                                <div class="map_canvas"></div>
                            </li>
                            <li>
                                <label for="title">Buscador</label>
                                <input id="geocomplete" type="text" placeholder="buscar" value="" />
                                <input id="find" type="button" value="Buscar" />
                            </li>
                            <li>
                                <label for="title">Cordinada 1 <span>*</span></label>
                                <div class="input"><?php echo form_input('coordinate1', set_value('coordinate1'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Cordinada 2 <span>*</span></label>
                                <div class="input"><?php echo form_input('coordinate2', set_value('coordinate2'), 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>