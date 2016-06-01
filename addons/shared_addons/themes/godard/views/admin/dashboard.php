<!-- Dashboard Widgets -->
<main class="dashboard">
    {{ widgets:area slug="dashboard" }}
    <div id="baseurl" class="hide"><?php echo site_url(); ?></div>
    <div class="help">
        <div class="icon"> <i class="fa fa-info-circle"></i> </div>
        <span>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic, est? In rerum voluptatem a amet laborum dolorum sequi et harum doloribus vero libero odio, reprehenderit unde, culpa quas perspiciatis, cum.</span>
    </div>
    <div class="langs"><span>Cambia el idioma del administrador</span>
        <?php echo form_open(site_url('admin'), 'class="form_es"'); ?>                    <input type="hidden" name="lang" value="es" >
        <a href="javascript:void(0)" class="change_es"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'es' ? 'es_img.png' : 'es_img_gris.png') ?>" width="50" height="40"/> </a>
        <?= form_close(); ?>

        <?php echo form_open(site_url('admin'), 'class="form_en"'); ?>
        <input type="hidden" name="lang" value="en" >
        <a href="javascript:void(0)" class="change_en"> <img src="<?php echo site_url(); ?>uploads/default/<?php echo ($lang_admin == 'en' ? 'en_img.png' : 'en_img_gris.png') ?>" width="50" height="40"/> </a>
        <?= form_close(); ?>
    </div>

    <section class="item">





        <div class="containerx"><div class="row">

                <div class="col s12 l9">
                    <div class="leads">
                        <h2>Listado de Leads</h2>
                        <div class="text">Un lead es un usuario del que solo conocemos su información básica. Ésta información es vital para poder mantener el contacto con el usuario y aumentar las ventas.</div>

                        <?php if (!empty($contact)): ?>

                            <a href="admin/contact_us/export_contact_mail/" class="btn-floating waves-effect waves-light tooltipped right" data-position="left" data-delay="50" data-tooltip="Exportar a excel"><i class="fa fa-download"></i></a>

                        <?php endif ?>
                        <div class="form_inputs" id="page-contact-us">
                            <fieldset>
                                <?php if (!empty($contact)): ?>
                                    <table border="0" class="table-list" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">Fecha</th>
                                                <th style="width: 20%">Nombre</th>
                                                <th style="width: 10%">Correo</th>
                                                <th class="width: 70%">Acciones</th>
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

                                                    <td class="status_email_<?= $contact_data->id; ?>" <?= $contact_data->color; ?>>
                                                        <a href="admin/contact_us/view_message_dashboard/<?php echo $contact_data->id; ?>" class="modal btn blue small view_message block">Ver</a>

        <!--                                           <a href="admin/contact_us/view_message_dashboard/<?php echo $contact_data->id; ?>" class=" btn-floating waves-effect waves-light tooltipped block modal" data-position="left" data-delay="50" data-tooltip="Exportar a excel"><i class="fa fa-eye"></i></a>-->


                                                        <a href="<?= site_url(); ?>admin/contact_us/view_contact_prod_items/<?= $contact_data->id; ?>" class="modal btn blue small view_contact_prod_items block">Productos</a>
                                                        <?php echo anchor('admin/contact_us/delete_email_dashboard/' . $contact_data->id, lang('global:delete'), array('class' => 'btn red small block status_' . $contact_data->status)) ?>
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

                <div class="col s12 l3">

                    <div class="myAdds">





                    </div>


                </div>

            </div></div>






    </section>
</main>
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
