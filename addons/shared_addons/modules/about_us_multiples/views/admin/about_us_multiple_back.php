<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Nosotros</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-text-intro"><span>Texto de Introduccion</span></a></li>
                <li><a href="#page-banner-customers"><span>Panel de texto</span></a></li>
                <li><a href="#page-banner-partners"><span>Nuestros Asociados</span></a></li>
                <li><a href="#page-about_us_work_team"><span>Certificaciones</span></a></li>
            </ul>

            <!-- TEXTO INFORMATIVO -->
            <div class="inline-form" id="page-text-intro">
                <fieldset>
                    <?php if (isset($intro)): ?>
                        <?php echo form_open_multipart(site_url('admin/about_us_multiples/edit_text_intro/'), 'id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Titulo de sección </label>
                                    <div class="input">
                                        <textarea class="wysiwyg-simple" name="title"><?php echo (isset($intro->title)) ? $intro->title : set_value('title'); ?></textarea>
                                    </div>
                                </li>
                                <li>
                                    <label for="name">Introducción </label>
                                    <div class="input">
                                        <textarea class="wysiwyg-simple" name="intro"><?php echo (isset($intro->intro)) ? $intro->intro : set_value('intro'); ?></textarea>
                                    </div>
                                </li>
                                <li>
                                    <label for="name">Imagen
                                        <small>
                                            - Imagen Permitidas gif | jpg | png | jpeg<br>
                                        </small>
                                    </label>
                                    <div class="input">
                                        <?php if (!empty($intro->image)): ?>
                                            <div>
                                                <img src="<?php echo site_url($intro->image) ?>" width="298">
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
                                    <label for="name">Texto </label>
                                    <div class="input">
                                        <textarea class="wysiwyg-simple" name="text"><?php echo (isset($intro->text)) ? $intro->text : set_value('text'); ?></textarea>
                                    </div>
                                </li>
                            </ul>
                            <?php
                            $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                            ?>
                        </fieldset>
                        <?php echo form_close(); ?>
                    <?php else: ?>
                        <p style="text-align: center">No hay datos actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>          

            <!-- slider clientes -->
            <div class="form_inputs" id="page-banner-customers">
                <fieldset>
                    <?php echo anchor('admin/about_us_multiples/create_customers/', '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($slide)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Titulo</th>
                                    <th style="width: 40%">Texto</th>
                                    <th class="width-10">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($slide as $customer): ?>
                                    <tr>
                                        <td><?php echo $customer->link ?></td>
                                        <td><?php echo $customer->image; ?></td>
                                        <td>
                                            <?php echo anchor('admin/about_us_multiples/edit_customers/' . $customer->id, lang('global:edit'), 'class="btn blue small"'); ?>
                                            <?php echo anchor('admin/about_us_multiples/delete_customers/' . $customer->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay un slider de clientes actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- slider Partners -->
            <div class="form_inputs" id="page-banner-partners">
                <fieldset>
                    <?php if (isset($intro)): ?>
                        <?php echo form_open_multipart(site_url('admin/about_us_multiples/edit_partners_intro/'), 'id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="link">Titulo </label>
                                    <div class="input"><?php echo form_input('title2', $intro->title2, 'class="dev-input-title" style="width:100%"'); ?></div>
                                </li>
                            </ul>
                            <?php
                            $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                            ?>
                        </fieldset>
                        <?php echo form_close(); ?>
                    <?php else: ?>
                        <p style="text-align: center">No hay datos actualmente</p>
                    <?php endif ?>
                </fieldset>
                <fieldset>
                    <?php echo anchor('admin/about_us_multiples/create_partners/', '<span>Nuevo</span>', 'class="btn blue"'); ?>

                    <?php if (!empty($partners)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Imagen</th>
                                    <th style="width: 40%">Link</th>
                                    <th class="width-10">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($partners as $partner): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($partner->image)): ?>
                                                <img src="<?php echo site_url($partner->image); ?>" style="width: 139px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $partner->link ?></td>
                                        <td>
                                            <?php echo anchor('admin/about_us_multiples/edit_partners/' . $partner->id, lang('global:edit'), 'class="btn blue small"'); ?>
                                            <?php echo anchor('admin/about_us_multiples/delete_partners/' . $partner->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay registros actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- Certificaciones -->
            <div class="form_inputs" id="page-about_us_work_team">
                <fieldset>
                    <?php if (isset($intro)): ?>
                        <?php echo form_open_multipart(site_url('admin/about_us_multiples/edit_team_intro/'), 'id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="link">Titulo </label>
                                    <div class="input"><?php echo form_input('title3', $intro->title3, 'class="dev-input-title" style="width:100%"'); ?></div>
                                </li>
                            </ul>
                            <?php
                            $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                            ?>
                        </fieldset>
                        <?php echo form_close(); ?>
                    <?php else: ?>
                        <p style="text-align: center">No hay datos actualmente</p>
                    <?php endif ?>
                </fieldset>
                <fieldset>
                    <?php echo anchor('admin/about_us_multiples/new_work_team/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($work_team)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Imagen</th>
                                    <th style="width: 15%">Link</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($work_team as $item): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($item->image)): ?>
                                                <img src="<?php echo site_url($item->image); ?>" style="height: 130px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $item->link ?></td>
                                        <td>
                                            <?php echo anchor('admin/about_us_multiples/edit_work_team/' . $item->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/about_us_multiples/delete_work_team/' . $item->id . '/' . $lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un servicio actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

        </div>
    </div>
</section>