<section class="title">
    <h4>Preguntas Frecuentes</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-faq"><span>Editar Pregunta Frecuente</span></a></li>
            </ul>
            <div class="form_inputs" id="page-faq">
                <?php echo form_open_multipart(site_url('admin/faqs/update/'.$lang_admin), 'id="form-wysiwyg"'); ?>
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
                                <?php if (!empty($faq->image)): ?>
                                    <div>
                                        <img src="<?php echo val_image($faq->image) ?>" width="298">
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
                            <label for="title">Nombre <span>*</span></label>
                            <div class="input"><?php echo form_input('name', $faq->name, 'class="dev-input-title"'); ?></div>
                        </li>
                        <li>
                            <label for="title">Referencia <span>*</span></label>
                            <div class="input"><?php echo form_input('reference', $faq->reference, 'class="dev-input-title"'); ?></div>
                        </li>
                        <li>
                            <label for="path">Categorias</label>
                            <select name="categories[]" multiple>
                                <option value="0">Seleccione una Opción</option>
                                <?php foreach ($categories as $item): ?>
                                    <option value="<?php echo $item->id; ?>" <?php echo (in_array($item->id, $selected_category)) ? 'selected' : null ?>>
                                        <?php echo $item->title; ?>
                                    </option>
                                <?php endforeach ?>
                            </select>
                        </li>
                        <li class="even">
                            <label for="name">
                                Descripción
                                <span>*</span>
                                <small>Evite pegar texto directamente desde un sitio web u otro editor de texto, de ser necesario use la herramienta pegar desde.</small>
                            </label>
                            <div class="input">
                                <div class="sroll-table">
                                    <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text_wysiwyg', 'value' => $faq->description, 'rows' => 30, 'class' => 'wysiwyg-advanced')) ?>
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
                            <div class="input"><?php echo form_textarea('introduction', $faq->introduction,'class="dev-input-textarea limit-text" length="100"'); ?></div>
                        </li>
                        <li>
                            <label for="name">Precio</label>
                            <div class="input">
                                <div class="input"><?php echo form_input('price', $faq->price); ?></div>
                            </div>
                        </li>
                    </ul>
                </fieldset>

                <div class="buttons float-right padding-top">
                    <?php echo form_hidden('id',$faq->id); ?>
                    <?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
                </div>
            </div>
            <?php echo form_close(); ?>
        </div>

    </div>
</div>
</section>