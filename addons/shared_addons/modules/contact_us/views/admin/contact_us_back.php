<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="item">
    <section class="title">
        <h4><?php echo lang('language:title') ?></h4>
    </section>
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-view"><span><?php echo lang('language:data') ?></span></a></li>
                <li><a href="#page-details"><span><?php echo lang('language:manage_data') ?></span></a></li>
                <li><a href="#page-google_maps"><span>Google Maps</span></a></li>
                <li><a href="#page-areas"><span>Areas</span></a></li>
            </ul>

            <div class="form_inputs" id="page-view">
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Facebook</label>
                                <div class="input"><?php echo isset($data->facebook) ? $data->facebook : "" ?></div>
                            </li>
                            <li>
                                <label for="name">linkedin</label>
                                <div class="input"><?php echo isset($data->linkedin) ? $data->linkedin : "" ?></div>
                            </li>
                            <li>
                                <label for="name">YouTube</label>
                                <div class="input"><?php echo isset($data->youtube) ? $data->youtube : "" ?></div>
                            </li>
                            <li>
                                <label for="name">Twitter</label>
                                <div class="input"><?php echo isset($data->twitter) ? $data->twitter : "" ?></div>
                            </li>
                            <li>
                                <label for="name">Instagram</label>
                                <div class="input"><?php echo isset($data->instagram) ? $data->instagram : "" ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:address') ?></label>
                                <div class="input"><?php echo isset($data->adress) ? $data->adress : "" ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:phone') ?></label>
                                <div class="input"><?php echo isset($data->phone) ? $data->phone : "" ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:email') ?></label>
                                <div class="input"><?php echo isset($data->email) ? $data->email : "" ?></div>
                            </li>
                        </ul>
                    </fieldset>
                </div>
            </div>
            <div class="form_inputs" id="page-details">
                <?php echo form_open(site_url('admin/contact_us/index/' . $lang_admin), 'id="form-wysiwyg"'); ?>
                <div class="inline-form">
                    <fieldset>
                        Las Direcciones Url es recomendable que siempre lleven el https:// Como por ejemplo https://www.facebook.com/ <br/><br/><br/>
                        <ul>
                            <li>
                                <label for="name">facebook</label>
                                <div class="input"><?php echo form_input('facebook', set_value('facebook', isset($data->facebook) ? $data->facebook : ""), ' id="facebook"'); ?></div>
                            </li>
                            <li>
                                <label for="name">linkedin</label>
                                <div class="input"><?php echo form_input('linkedin', set_value('linkedin', isset($data->linkedin) ? $data->linkedin : ""), ' id="linkedin"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Twitter</label>
                                <div class="input"><?php echo form_input('twitter', set_value('twitter', isset($data->twitter) ? $data->twitter : ""), ' id="twitter"'); ?></div>
                            </li>
                            <li>
                                <label for="name">YouTube</label>
                                <div class="input"><?php echo form_input('youtube', set_value('youtube', isset($data->youtube) ? $data->youtube : ""), ' id="youtube"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Instagram</label>
                                <div class="input"><?php echo form_input('instagram', set_value('instagram', isset($data->instagram) ? $data->instagram : ""), ' id="instagram"'); ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:address') ?></label>
                                <div class="input"><?php echo form_input('adress', set_value('adress', isset($data->adress) ? $data->adress : ""), ' id="adress"'); ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:phone') ?></label>
                                <div class="input"><?php echo form_input('phone', set_value('phone', isset($data->phone) ? $data->phone : ""), ' id="phone"'); ?></div>
                            </li>
                            <li>
                                <label for="name"><?php echo lang('language:email') ?></label>
                                <div class="input"><?php echo form_input('email', set_value('correo', isset($data->email) ? $data->email : ""), ' id="email"'); ?></div>
                            </li>
                            <li>
                                <div class="buttons float-right padding-top">
                                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                                </div>
                            </li>
                        </ul>
                    </fieldset>
                    <?php echo form_close(); ?>
                </div>
            </div>
            <div class="form_inputs" id="page-google_maps">
                <fieldset>
                    <?php if (!empty($google_maps)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 15%">Nombre</th>
                                    <th style="width: 15%">Latitud</th>
                                    <th style="width: 20%">Longitud</th>
                                    <th style="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php foreach ($google_maps as $google_map): ?>
                                    <tr>
                                        <td><?php echo $google_map->name ?></td>
                                        <td><?php echo $google_map->coordinate1 ?></td>
                                        <td><?php echo $google_map->coordinate2 ?></td>
                                        <td>
                                            <?php echo anchor('admin/contact_us/edit/' . $google_map->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay Registros actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
            <div class="form_inputs" id="page-areas">
                <fieldset>
                    <?php echo anchor('admin/contact_us/create_email/', '<span>+ Nuevo Comentario</span>', 'class="btn blue"'); ?>                  
                    <br>
                    <br>

                    <?php if (!empty($emails_area)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 25%">Titulo</th>
                                    <th style="width: 30%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($emails_area as $email): ?>
                                    <tr>
                                        <td><?php echo $email->title; ?></td>
                                        <td>
                                            <?php echo anchor('admin/contact_us/destroy_email/' . $email->id.'/'.$data->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                            <?php echo anchor('admin/contact_us/edit_email/' .$email->id, lang('global:edit'), array('class' => 'btn green small button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay Registros actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
        </div>
    </div>
</section>
