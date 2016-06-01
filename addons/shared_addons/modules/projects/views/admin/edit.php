<section class="title">
    <h4>Proyectos</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-project"><span>Editar</span></a></li>
            </ul>
            <div class="form_inputs" id="page-project">
                <?php echo form_open_multipart(site_url('admin/projects/update/' . $lang_admin), 'id="form-wysiwyg"'); ?>
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
                                    <?php if (!empty($project->image)): ?>
                                        <div>
                                            <img src="<?php echo val_image($project->image) ?>" width="298">
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
                                <label for="detail">Ver Archivo
                                </label>
                                <div class="input">
                                    <label class="radio">
                                        <input name="seefile" type="checkbox" <?php echo ($project->seefile == 1)? "checked" : ""; ?>/>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <label for="name">Archivo
                                    <small>
                                        - Formatos Permitidos pdf<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <?php if (!empty($project->file)): ?>
                                        <div>
                                            <a href="<?php echo val_image($project->file) ?>" target="_blank">Ver Archivo</a>
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('file', '', ' id="file"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="title">Nombre</label>
                                <div class="input"><?php echo form_input('name', $project->name, 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="title">Categoria</label>
                                <div class="input">
                                    <select name="category">
                                        <?php foreach($categories as $cate){?>
                                        <option value="<?php echo $cate->id?>" <?php echo ($project->category == $cate->id)? "selected" : ""; ?>><?php echo $cate->title;?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </li>
                            <li class="even">
                                <label for="name">
                                    Descripción
                                    <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>
                                </label>
                                <div class="input">
                                    <div class="sroll-table">
                                        <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $project->description, 'rows' => 30, 'class' => 'wysiwyg-simple')) ?>
                                        <input type="hidden" name="content" id="text">
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="introduction">Introducción
                                </label>
                                <div class="input"><?php echo form_textarea('introduction', $project->introduction, 'class="dev-input-textarea" length="100"'); ?></div>
                            </li>
                        </ul>
                    </fieldset>

                    <div class="buttons float-right padding-top">
                        <?php echo form_hidden('id', $project->id); ?>
                        <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>