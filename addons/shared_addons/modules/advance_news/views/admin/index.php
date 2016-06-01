<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Noticias</h4>
    <a href="<?php echo site_url(); ?>admin/advance_news/index/es"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'es' ? 'es_img.png' : 'es_img_gris.png') ?>" width="50" height="40"/> </a>
    <a href="<?php echo site_url(); ?>admin/advance_news/index/en"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'en' ? 'en_img.png' : 'en_img_gris.png') ?>" width="50" height="40"/> </a>
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-advance_news"><span>Todas las noticias</span></a></li>
            </ul>

            <!-- NOTICIAS -->

            <div class="form_inputs" id="page-advance_news">
                <fieldset>
                    <?php echo anchor('admin/advance_news/edit_advance_new/0/'.$lang_admin, '<span>+ Crear Noticia</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($advance_news)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 5%"></th>
                                    <th style="width: 45%">Titulo</th>
                                    <th style="width: 30%">Introducción</th>
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
                                <?php foreach ($advance_news as $advance_new): ?>
                                    <tr>
                                        <td><?php echo $i ?></td>
                                        <td><?php echo $advance_new->title ?></td>
                                        <td><?php echo substr($advance_new->introduction, 0,150) ?></td>
                                        <td>
                                            <?php echo anchor('admin/advance_news/edit_advance_new/'.$advance_new->id.'/'.$lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/advance_news/images/' . $advance_new->id, "Imagenes", 'class="btn orange small"'); ?>
                                            <?php echo anchor('admin/advance_news/delete_advance_new/'.$advance_new->id.'/'.$lang_admin, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
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