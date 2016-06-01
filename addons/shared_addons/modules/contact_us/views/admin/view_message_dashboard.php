<div class="form_inputs" id="page-view">
    <div class="inline-form">
        <fieldset>
            <ul class="datos_detalle">
                <?php if (!empty($data)): ?>
                    <div class="nombre"><b><?php echo isset($data->name) ? $data->name : "" ?></b></div>
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><b>Correo:</b></td>
                            <td><?php echo isset($data->email) ? $data->email : "" ?></td>
                        </tr>
                        <tr>
                            <td><b>Teléfono:</b></td>
                            <td><?php echo isset($data->phone) ? $data->phone : "" ?></td>
                        </tr>
                        <tr>
                            <td><b>Celular:</b></td>
                            <td><?php echo isset($data->cell) ? $data->cell : "" ?></td>
                        </tr>
                        <tr>
                            <td><b>Ciudad:</b></td>
                            <td><?php echo isset($data->city) ? $data->city : "" ?></td>
                        </tr>
                        <tr>
                            <td><b>Compañia / Empresa:</b></td>
                            <td><?php echo isset($data->company) ? $data->company : "" ?></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b>Mensaje:</b><br /><br />
                                <?php echo isset($data->message) ? $data->message : "" ?>
                            </td>
                        </tr>
                    </table>
                <?php endif ?>
            </ul>
        </fieldset>
    </div>
</div>