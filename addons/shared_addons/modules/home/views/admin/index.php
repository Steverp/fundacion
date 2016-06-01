<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Inicio</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-banner"><span>Banner</span></a></li>
                <li><a href="#page-links"><span>Links Destacados</span></a></li>
                <li><a href="#page-video-info"><span>Texto Informativo</span></a></li>
                <li><a href="#page-numbers"><span>Áreas de Especialidad</span></a></li>
                <li><a href="#page-people"><span>Nuestros Clientes</span></a></li>
            </ul>

            <!-- BANNER -->
            <div class="form_inputs" id="page-banner">
<!--                <fieldset>
                    <?php if (isset($linkintro)): ?>
                        <?php echo form_open_multipart(site_url('admin/home/edit_banner_info/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Link</label>
                                    <div class="input"><?php echo form_input('linkbanner', (isset($linkintro->linkbanner)) ? $linkintro->linkbanner : set_value('linkbanner'), 'class="dev-input-title"'); ?></div>
                                </li>
                                <li>
                                    <label for="name">Titulo de link</label>
                                    <div class="input"><?php echo form_input('titlelinkbanner', (isset($linkintro->titlelinkbanner)) ? $linkintro->titlelinkbanner : set_value('titlelinkbanner'), 'class="dev-input-title"'); ?></div>
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
                </fieldset>-->
                <fieldset>
                    <?php echo anchor('admin/home/create_banner/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($banner)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Imagen</th>
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 20%">Texto</th>
                                    <th style="width: 20%">Link</th>
                                    <th class="width: 20%">Acciones</th>
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
                                <?php foreach ($banner as $slide): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($slide->image)): ?>
                                                <img src="<?php echo site_url($slide->image); ?>" style="width: 139px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $slide->title ?></td>
                                        <td><?php echo $slide->text ?></td>
                                        <td><a href="<?php echo $slide->link ?>"><?php echo $slide->link ?></a></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_banner/' . $slide->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_banner/' . $slide->id, lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay un slide actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- LINKS -->
            <div class="form_inputs" id="page-links">
                <fieldset>
                    <?php if (isset($linkintro)): ?>
                        <?php echo form_open_multipart(site_url('admin/home/edit_link_info/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Titulo</label>
                                    <div class="input"><?php echo form_input('title', (isset($linkintro->title)) ? $linkintro->title : set_value('title'), 'class="dev-input-title"'); ?></div>
                                </li>
                                <li>
                                    <label for="name">Logo
                                    </label>
                                    <div class="input">
                                        <?php if (!empty($linkintro->logo)): ?>
                                            <div>
                                                <img src="<?php echo site_url($linkintro->logo) ?>" width="80">
                                            </div>
                                        <?php endif; ?>
                                        <div class="btn-false">
                                            <div class="btn">Examinar</div>
                                            <?php echo form_upload('logo', '', ' id="logo"'); ?>
                                        </div>
                                    </div>
                                    <br class="clear">
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

                    <?php echo anchor('admin/home/create_link/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>

                    <?php if (!empty($links)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Titulo</th>
                                    <th style="width: 40%">link</th>
                                    <th class="width: 20%">Acciones</th>
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
                                <?php foreach ($links as $link): ?>
                                    <tr>
                                        <td><?php echo $link->title ?></td>
                                        <td>
                                            <a href="<?php echo $link->link; ?>" target="_blank"><?php echo $link->link ?></a>
                                        </td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_links/' . $link->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_links/' . $link->id, lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay elementos actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- VIDEO INFORMATIVO -->
            <div class="inline-form" id="page-video-info">
                <fieldset>
                    <?php if (isset($video)): ?>
                        <?php echo form_open_multipart(site_url('admin/home/edit_video_info/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Imagen
                                    </label>
                                    <div class="input">
                                        <?php if (!empty($video->image)): ?>
                                            <div>
                                                <img src="<?php echo site_url($video->image) ?>" width="298">
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
                                    <label for="title">Titulo</label>
                                    <div class="input">
                                        <textarea name="title" class="wysiwyg-simple" ><?php echo (isset($video->title)) ? $video->title : set_value('title'); ?></textarea>
                                    </div>
                                </li>
                                <li>
                                    <label for="name">Texto</label>
                                    <div class="input">
                                        <?php echo form_textarea(array('id' => 'text', 'name' => 'text', 'value' => (isset($video->text)) ? $video->text : set_value('text'), 'rows' => 8, 'maxlength' => 400, 'style' => "width: 100%;height: 100px")) ?>
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

            <!-- AREAS DE PRACTICA -->
            <div class="form_inputs" id="page-numbers">
                <fieldset>
                    <?php if (isset($video)): ?>
                        <?php echo form_open_multipart(site_url('admin/home/edit_video_info/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Titulo de Sección</label>
                                    <div class="input">
                                        <textarea name="title1" class="wysiwyg-simple"><?php echo (isset($video->title1)) ? $video->title1 : set_value('title1'); ?></textarea>
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
                <fieldset>

                    <?php echo anchor('admin/home/edit_numbers/0/' . $lang_admin, '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>

                    <?php if (!empty($numbers)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Titulo</th>
                                    <th style="width: 40%">Texto</th>
                                    <th class="width: 20%">Acciones</th>
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
                                <?php foreach ($numbers as $number): ?>
                                    <tr>
                                        <td><?php echo $number->title ?></td>
                                        <td><?php echo $number->text ?></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_numbers/' . $number->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_numbers/' . $number->id, lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay elementos actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- EQUIPO DE TRABAJO -->
            <div class="form_inputs" id="page-people">
                <fieldset>
                    <?php if (isset($video)): ?>
                        <?php echo form_open_multipart(site_url('admin/home/edit_video_info/' . $lang_admin), 'class="crud" id="form-wysiwyg"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="name">Titulo de Sección</label>
                                    <textarea name="clientes" class="wysiwyg-simple"><?php echo (isset($video->clientes)) ? $video->clientes : set_value('clientes'); ?></textarea>
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
                    <?php echo anchor('admin/home/create_people/', '<span>Nuevo</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($people)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 40%">Imagen</th>
                                    <th style="width: 40%">nombre</th>
                                    <th class="width-10">Acciones</th>
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
                                <?php foreach ($people as $pe): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($pe->image)): ?>
                                                <img src="<?php echo site_url($pe->image); ?>" style="width: 139px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $pe->title ?></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_people/' . $pe->id, lang('global:edit'), 'class="btn blue small"'); ?>
                                            <?php echo anchor('admin/home/delete_people/' . $pe->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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

        </div>
    </div>
</section>