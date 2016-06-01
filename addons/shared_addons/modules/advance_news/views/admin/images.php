<section class="title">
    <h4>Noticias / <?php echo ucfirst($advance_new->title) ?> / Imagenes</h4>
    <a href="<?php echo site_url('admin/advance_news') ?>" class="btn small">Volver a las Noticias</a>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-advance_news"><span>Imagenes</span></a></li>
            </ul>

            <!-- IMAGENES -->
            <div class="form_inputs" id="page-advance_news">
                <fieldset>

                    <?php echo anchor('admin/advance_news/create_image/'.$advance_new->id, '<span>+ Nueva Imagen</span>', 'class="btn blue"'); ?>					
                    <br>
                    <br>

                    <?php if (!empty($images)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 70%">Imagen</th>
                                    <th style="width: 30%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($images as $image): ?>
                                    <tr>
                                        <td><?php if(!empty($image->path)): ?>                                        		
                                        	<img src="<?php echo val_image($image->path) ?>" alt="imagen" height="100">                                        	
                                        	<?php else: ?>                                        		
                                        		<?php echo $image->video; ?>                                        	
                                        	<?php endif; ?>
                                        <td>
                                            <?php echo anchor('admin/advance_news/destroy_image/' . $image->id.'/'.$advance_new->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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