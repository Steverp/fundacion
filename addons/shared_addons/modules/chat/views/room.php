<div class="row-fluid">
    <div class="span12">
        <div id="chat-room">
            <div data-content='messages' style='display: block; min-height: 200px; background: white; border: 1px solid #000; max-height: 400px; overflow: auto; position: relative;'>
                <ul class="unstyled" style="padding: 1em;"></ul>
            </div>

            <p id="sending-message" style="display: none;">
                <em>Enviando mensaje, por favor espere...</em>
            </p>

            <?php echo form_open('chat/send_message', 'id="send-message-form"', array('assign_id' => $assign->id, 'sender' => 'admin')) ?>

                <div class="row-fluid" style="margin-top: 2em;">
                    <div class="span10">
                        <input class="span12" type="text" name="message" id="message" placeholder="Escriba acá el mensaje..." required>
                    </div>
                    <div class="span2">
                        <button class="btn btn-primary btn-block" type=submit">Enviar</button>
                    </div>
                </div>

            <?php echo form_close() ?>
        </div>

    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <div>
            <a href="<?= site_url('admin/chat/assign/close_room/' . $assign->id) ?>?return_to=chat/assign" class="btn btn-warning" data-toggle="close-room" data-confirm="¿Está seguro que desea cerrar la conversación?">Cerrar conversación</a>
        </div>
    </div>
</div>


<script id="messages-template" type="text/x-handlebars-template">
    {{ noparse }}
    
    {{ #each messages }}
        <li class="chat-message {{#if is_loading}}is-loading{{/if}}" data-id="{{ id }}">
        <strong class="sender-{{ sender }}">{{ username }}: </strong>
        <em><small><time class="timeago" datetime="{{ datetime_iso }}" data-toggle="tooltip">{{ datetime }}</time></small></em>
        <p style="margin-left: 1em;">{{ message }}</p>
        </li>
    {{ /each }}

    {{ /noparse }}
</script>



<audio id="chatAudio">
    <source src="<?= base_url() ?>assets/audio/notify.ogg" type="audio/ogg">
    <source src="<?= base_url() ?>assets/audio/notify.mp3" type="audio/mpeg">
    <source src="<?= base_url() ?>assets/audio/notify.wav" type="audio/wav">
</audio>