<div class="form_inputs" id="page-view">
    <div class="inline-form">
        <fieldset>
            <ul class="datos_detalle">
                <?php if (!empty($data)): ?>
                    <div class="nombre"><?php echo isset($data->name) ? $data->name : "" ?></div>
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
                    <?php /* ?><li>
                      <b>Correo:</b> <?php echo isset($data->email) ? $data->email : "" ?>
                      </li>
                      <li>
                      <b>Teléfono:</b> <?php echo isset($data->phone) ? $data->phone : "" ?>
                      </li>
                      <li>
                      <b>Celular:</b> <?php echo isset($data->cell) ? $data->cell : "" ?>
                      </li>
                      <li>
                      <b>Compañia / Empresa:</b> <?php echo isset($data->company) ? $data->company : "" ?>
                      </li>
                      <li>
                      <b>Mensaje:</b><br />
                      <?php echo isset($data->message) ? $data->message : "" ?>
                      </li><?php */ ?>
                <?php endif ?>
            </ul>
        </fieldset>
    </div>
</div>