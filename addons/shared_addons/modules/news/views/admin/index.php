<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Actualidad</h4>

</section>
<section class="item">
    <div class="content">
        <div class="tabs">
<!--
            <ul class="tab-menu">
                <li><a href="#page-news"><span>Todas las noticias</span></a></li>
				<li><a href="#page-comments"><span>Ultimos Comentarios</span></a></li>
            </ul>
-->

            <!-- NOTICIAS -->

            <div class="form_inputs" id="page-news">
                <fieldset>
                    <?php echo anchor('admin/news/edit_new/0/'.$lang_admin, '<span>+ Crear entrada</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($news)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 5%"></th>
                                    <th style="width: 20%">Imagen</th>
                                    <th style="width: 15%">Titulo</th>
                                    <th style="width: 30%">Introducción</th>
<!--                                    <th style="width: 10%">Destacado</th>-->
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
                            <?php $i = $pag + 1; ?>
                                <?php foreach ($news as $new): ?>
                                    <tr>
                                        <td><?php echo $i ?></td>
                                        <td>
                                            <?php if (!empty($new->image)): ?>
                                                <img src="<?php echo site_url($new->image); ?>" style="height: 130px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $new->title ?></td>
                                        <td><?php echo substr($new->introduction, 0,150) ?></td>
<!--                                        <td><a class="outstanding_news" href="admin/news/outstanding_news/<?php echo $new->id.'/'.$lang_admin; ?>"><img src="<?php echo site_url().'uploads/default/'.($new->outstanding == 1 ? 'estrella' : 'estrella_gris').'.png'; ?>" border="0"></a> </td>-->
                                        <td>
                                            <?php echo anchor('admin/news/edit_new/'.$new->id.'/'.$lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/news/delete_new/'.$new->id.'/'.$lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                    <?php $i++; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay una noticia actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
			

			
			
        </div>
    </div>
</section>