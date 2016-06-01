<section class="title">
    <h4>Mapas de google</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-google_map"><span>Editar</span></a></li>
            </ul>
            <div class="form_inputs" id="page-google_map">
                <?php echo form_open_multipart(site_url('admin/contact_us/update/'.$google_map->id.'/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li class="hide">
                                <label for="path">Categorias</label>
                                <select name="categories[]" multiple>
                                    <option value="1" selected >Seleccione una Opción</option>
                                </select>
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
                                <label for="title">Latitud<span>*</span></label>
                                <div class="input"><?php echo form_input('coordinate1', $google_map->coordinate1, 'id="lat" class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Longitud<span>*</span></label>
                                <div class="input"><?php echo form_input('coordinate2', $google_map->coordinate2, 'id="lng" class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Nombre</label>
                                <div class="input"><?php echo form_input('name', $google_map->name, 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $google_map->id); ?>
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>