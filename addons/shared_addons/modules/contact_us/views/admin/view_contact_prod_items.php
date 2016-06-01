<fieldset>
    Productos:
    <?php if (!empty($products)): ?>

        <table border="0" class="table-list" cellspacing="0">
            <thead>
                <tr>
                    <th style="width: 20%">Nombre</th>
                    <th style="width: 20%">Imagen</th>
                    <th style="width: 40%">Descripción</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($products as $productse):
                    ?>
                    <tr>
                        <td><?php echo $productse->name ?></td>
                        <td>
                            <?php if (!empty($productse->image)): ?>
                                <img src="<?= $productse->image ?>" style="height: 130px;">
                            <?php endif; ?>
                        </td>
                        <td><?= substr(strip_tags($productse->description), 0, 100) ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>

    <?php else: ?>
        <p style="text-align: center">No se registraron Productos en este mensaje.</p>
    <?php endif ?>

</fieldset>