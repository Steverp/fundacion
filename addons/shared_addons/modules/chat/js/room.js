(function($) {

    var first = true,
            ajax_bind = null;

    function render_new_messages(messages) {
        var source = $("#messages-template").html();
        var template = Handlebars.compile(source);
        var $content = $('[data-content="messages"]');


        console.log(messages);

        var html = template({messages: messages});

        if (first) {
            $content.find('ul').html(html);
        } else {
            $content.find('ul').append(html);
        }

        $content.animate({scrollTop: $content[0].scrollHeight}, 1000);

        $('time.timeago').timeago();

        $('#sending-message').hide();
    }

    // Sound notify
    function sound_notify() {
        return $('#chatAudio')[0].play();
    }

    // Bind
    function bind() {

        ajax_bind = $.ajax({
            url: 'api/chat/bind.json',
            dataType: 'json',
            data: $('#send-message-form').serialize() + '&first=' + first + '&last_id=' + $('.chat-message:last').data('id'),
            type: 'get',
            success: function(response) {
                if (response.messages) {
                    render_new_messages(response.messages);

                    if (!first) {
                        $.each(response.messages, function() {
                            if (!this.is_own) {
                                sound_notify();
                            }
                        });
                    }

                }

                first = false;

                return bind();
            }
        });

    }


    $(document).on('submit', '#send-message-form', function() {
        var $this = $(this),
                data = $this.serialize();

        $.ajax({
            url: $this.attr('action'),
            dataType: 'json',
            data: data,
            type: 'post',
            beforeSend: function() {
                $('#sending-message').show();
            }
        });

        $this.find('[name="message"]').val('');

        return false;
    });

    $(document).on('ready', bind);

    $(document).on('click', '[data-toggle="close-room"]', function() {
        return confirm($(this).data('confirm'));
    });

})(window.jQuery);