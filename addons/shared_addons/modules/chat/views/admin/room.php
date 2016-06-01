<div class="one_full">
    <section class="title">
        <h4>Room</h4>
    </section>

    <section class="item">
        <div id="chat-room" class="content" style="padding: 2em">
            <div data-content='messages' style='display: block; min-height: 200px; background: white; border: 1px solid #000; max-height: 400px; overflow: auto; position: relative;'>
                <ul style="padding: 1em;"></ul>
            </div>

            <p id="sending-message" style="display: none;">
                <em>Enviando mensaje, por favor espere...</em>
            </p>

            <?php echo form_open('admin/chat/assign/send_message', 'id="send-message-form"', array('assign_id' => $assign->id, 'sender' => 'admin')) ?>
            <input type="text" name="message" id="message" style="width: 80%;" placeholder="Escriba acá el mensaje..." required>
            <button type=submit">Enviar</button>
            <?php echo form_close() ?>
        </div>

        <div class="content">
            <a href="<?= site_url('admin/chat/assign/close_room/' . $assign->id) ?>" class="btn red" data-toggle="close-room" data-confirm="¿Está seguro que desea cerrar la conversación?">Cerrar conversación</a>
        </div>
    </section>
</div>

<script id="messages-template" type="text/x-handlebars-template">
    {{#each messages}}
    <li class="chat-message {{#if is_loading}}is-loading{{/if}}" data-id="{{ id }}">
    <strong>{{ username }}: </strong>
    <time class="timeago" datetime="{{ datetime_iso }}">{{ datetime }}</time>
    <p>{{ message }}</p>
    </li>
    {{/each}}
</script>

<audio id="chatAudio">
    <source src="<?= base_url() ?>assets/audio/notify.ogg" type="audio/ogg">
    <source src="<?= base_url() ?>assets/audio/notify.mp3" type="audio/mpeg">
    <source src="<?= base_url() ?>assets/audio/notify.wav" type="audio/wav">
</audio>