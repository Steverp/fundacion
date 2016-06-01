<!-- Dashboard Widgets -->
{{ widgets:area slug="dashboard" }}

<div id="baseurl" class="hide"><?php echo site_url(); ?></div>
<section class="title">
    <h4>Mensajes </h4>
</section>

<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">
                <li>
                    <a href="#page-contact-us"><span>Contactos</span></a>
                </li>
                <li>
                    <a href="#page-quiz"><span>Encuesta</span></a>
                </li>
            </ul>
            <!--BANDEJA DE CORREOS DE CONTACTENOS-->
            <div class="form_inputs" id="page-contact-us">
                <fieldset>
                    <?php if (!empty($contact)): ?>
                        <?php echo anchor('admin/contact_us/export_contact_mail/', '<span>Exportar a Excel</span>', 'class="btn blue small"'); ?>
                    <?php endif ?>
                    <?php if (!empty($contact)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 10%">Fecha</th>
                                    <th style="width: 10%">Nombre</th>
                                    <th style="width: 20%">Correo</th>
                                    <th class="width: 5%">Telefono</th>
                                    <th class="width: 5%">Celular</th>
                                    <th class="width: 5%">Compañia</th>
                                    <th class="width: 5%">Ciudad</th>
                                    <th class="width: 5%">Acciones</th>
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
                                <?php foreach ($contact as $contact_data): ?>
                                    <tr>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo fecha_spanish_full_hour($contact_data->date) ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->name ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->email ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->phone ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->cell ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->company ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>><?php echo $contact_data->city ?></td>
                                        <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>>
                                            <a href="admin/contact_us/view_message_dashboard/<?php echo $contact_data->id; ?>" class="modal btn blue small view_message">Ver</a>
                                            <!--<a href="<?= site_url(); ?>admin/contact_us/view_contact_prod_items/<?= $contact_data->id; ?>" class="modal btn blue small view_contact_prod_items">Soluciones</a>-->
                                            <?php echo anchor('admin/contact_us/delete_email_dashboard/' . $contact_data->id, lang('global:delete'), array('class' => 'btn red small confirm button status_' . $contact_data->status)) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay Correos de Contactanos actualmente</p>
                    <?php endif ?>

                </fieldset>
            </div>

            <div class="form_inputs" id="page-quiz">
                <fieldset>
                    <?php if (!empty($contact)): ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Asunto</th>
                                    <th style="width: 70%">Comentario</th>
                                    <th class="width: 5%">Acciones</th>
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
                                <?php foreach ($quiz as $enc): ?>
                                    <tr>
                                        <td><?php echo $enc->id_subject ?></td>
                                        <td><?php echo $enc->comment ?></td>

                                        <td class="status_email_<?= $enc->id; ?>" <?= $enc->color; ?>>
                                            <?php echo anchor('admin/contact_us/delete_email_dashboard/' . $enc->id, lang('global:delete'), array('class' => 'btn red small confirm button')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay Correos de Contactanos actualmente</p>
                    <?php endif ?>

                </fieldset>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    (function ($) {

        $('#remove_installer_directory').on('click', function (e) {
            e.preventDefault();
            var $parent = $(this).parent();
            $.get(SITE_URL + 'admin/remove_installer_directory', function (data) {
                $parent.removeClass('warning').addClass(data.status).html(data.message);
            });
        });
    })(jQuery);

    $(document).ready(function ()
    {
        var base_url = $('#baseurl').html();  // seleccionamos la base url de un div

        $(document).on("click", ".view_message", function (event) {
            event.preventDefault();
            var action = $(this).attr('href');
            $.ajax({
                type: "POST",
                url: base_url + $(this).attr('href'),
                beforeSend: function () {
                    $("#cboxContent").html('<img src="' + base_url + 'uploads/default/loading.gif" width="28" height="28"/>');
                },
                success: function (html) {
                    var id = action.split('/');
                    id = id[3];
                    update_status(id);
                    $("#cboxContent").html(html);

                },
                error: function (err)
                {
                    alert("Ocurrió un error. Por favor inténtelo de nuevo.");
                }
            });
        });

        $(document).on("click", ".status_0", function (event) {
            event.preventDefault();
            confirm('¿Esta seguro que desea eliminar esto antes de ser leido? No se puede deshacer.');
        });
        $(document).on("click", ".status_1", function (event) {
            event.preventDefault();
            confirm('¿Esta seguro que desea eliminar esto? No se puede deshacer.');
        });

        function update_status(id) {
            $('.status_email_' + id).removeAttr('style');
        }
        $(document).on("click", ".change_es", function () {
            var url = $('.form_es').attr('action');
            $('.form_es').submit();

        });
        $(document).on("click", ".change_en", function () {
            var url = $('.form_en').attr('action');
            $('.form_en').submit();
        });
    });

</script>
