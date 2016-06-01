/**
 * API for Chat
 *
 * @author      Rigo B Castro - Imaginamos Dev Team
 * @website     http://imaginamos.com
 * @website     http://rigobcastro.com
 * @version     1.0.2
 */
(function($, sessionStorage, undefined) {
    // Initial vars
    var Tienda = Tienda || {}, domain = window.CHAT_SERVER_URL + '/api/chat/';

    // Content for work
    var content = {
        login: '[data-content="login-chat"]',
        messages: '[data-content="chat-messages"]',
        new_messages: '[data-content="new-messages"]',
        chat: '[data-content="chat"]',
        chat_size: '[data-chat="height"]',
        status_message: '[data-content="chat-status-message"]',
        icon_status: '[data-content="icon-status"]'
    };

    // Content for work
    var forms = {
        login: '[data-form="login-chat"]',
        message: '[data-form="message-area"]'
    };

    // Toggles for work
    var toggles = {
        open: '[data-toggle="open-chat"]',
        close: '[data-toggle="close-chat"]',
        // Titles
        title_open: '[data-toggle="title-open-chat"]',
        title_close: '[data-toggle="title-close-chat"]',
        // Submit btns
        send_email: '[data-toggle="send-email"]',
        join_chat: '[data-toggle="join-chat"]',
    };

    // URLS for work
    var urls = {
        save_first_room: 'save_first_room.jsonp',
        check_online: 'check_status_online.jsonp',
        update: 'bind.jsonp',
        send_message: 'send_message.jsonp'
    };

    // Check sessionStorage
    var storageExists = 'sessionStorage' in window && window['sessionStorage'] !== null,
            // Item for key session storage uses
            itemKey = 'chat_assing_id',
            // Chat assign id persist
            chat_assing_id = storageExists ? sessionStorage[itemKey] : null,
            // current username
            current_username = null;

    // know if is first load of messages
    var first = true;

    // All binds XHRPool for abort all
    $.xhrPool = []; // array of uncompleted requests
    $.xhrPool.abortAll = function() { // our abort function
        $(this).each(function(idx, jqXHR) {
            jqXHR.abort();
        });
        $.xhrPool.length = 0;
    };

    // === Private Methods

    // Sound notify
    function sound_notify() {
        return $('#chatAudio')[0].play();
    }

    // Show chat content
    function auto_height_chat() {

        if ($(toggles.open).is(':hidden') && !$(toggles.close).is(':hidden')) {
            $(content.chat).height($(content.chat_size).outerHeight(true) + $(forms.message).outerHeight(true));
        }

        return;
    }

    function show_chat(event) {
        $('.chat').addClass('openchat');
        if (event) {
            event.preventDefault();
        }

        $(toggles.open).hide();
        $(toggles.close).show();

        $('[name="message"]').focus();

        return auto_height_chat();
    }

    // Hide show content
    function hide_chat(event) {
        $('.chat').removeClass('openchat');
        $(content.chat).height(0);

        if (event) {
            event.preventDefault();
        }

        $(toggles.close).hide();
        $(toggles.open).show();
    }

    // Show login form chat and hide chat messages content
    function show_login_form() {
        $(content.messages).fadeOut();
        $(content.login).show();
    }

    // Hide login form chat and show chat messages content
    function hide_login_form() {
        $(content.login).fadeOut();
        $(content.messages).show();
    }

    // Show form for send message
    function show_message_form() {
        $(forms.message).show();
        return auto_height_chat();
    }

    // HIde form for send message
    function hide_message_form() {
        $(forms.message).hide();
        return auto_height_chat();
    }

    // Clear session
    function clear_session() {
        if (storageExists) {
            sessionStorage.removeItem(itemKey);
            chat_assing_id = false;
        }
    }

    // Update in DOM the message
    function update_status_message(message) {
        return $(content.status_message).html(message);
    }

    // Save first room
    function save_first_room() {
        return $.ajax({
            url: (domain + urls.save_first_room),
            data: $(forms.login).serialize(),
            dataType: 'jsonp',
            type: 'get',
            success: function(response) {
                if (response.status === true) {
                    if (response.new_assign_id) {
                        sessionStorage.setItem(itemKey, response.new_assign_id);
                        chat_assing_id = response.new_assign_id;
                    }

                    // Primer mensaje de espera
                    if (response.awaiting_message) {
                        update_status_message(response.awaiting_message);
                    }

                    first = true;
                    Tienda.Chat.bind();

                    // Return hide login
                    show_chat();
                    hide_login_form();
                }
            }
        });
    }

    // Verify status
    function verify_status(status, message) {
        var status_color = 'red';

        if (true === status) {
            status_color = '#60FF00';
        }

        $(content.icon_status).css('color', status_color);

        Tienda.Chat.online = status;

        $(forms.login).data('online', status);

        return update_status_message(message);
    }

    // Render with template new messages
    function render_new_messages(messages, first_load) {
        var self = this,
                data = {messages: messages};

        var $html = self.$template(data),
                $content = $(content.new_messages);


        if (first_load) {
            $content.html($html);
        } else {
            $content.append($html);

            $.each(messages, function() {
                if (!this.is_own) {
                    sound_notify();
                }
            });
        }

        $content.animate({scrollTop: $content[0].scrollHeight}, 1000);

        $('time.timeago').timeago();
    }

    // === Public Object

    // Object for Chat
    Tienda.Chat = {
        online: false,
        ajax_bind: null,
        init: function() {
            this.$template = Handlebars.compile($('#message-template').html());
            this.check_assign();
        },
        // Check assign
        check_assign: function() {
            // First hide message form
            hide_message_form();
            // Check assign then show/hide login form
            if (chat_assing_id !== undefined && chat_assing_id !== null) {
                hide_login_form();
            } else {
                show_login_form();
            }

            // Run check online
            this.check_online();

            return this;
        },
        // Check chat status online/offline
        check_online: function() {
            var self = this;

            $.ajax({
                url: (domain + urls.check_online),
                dataType: 'jsonp',
                type: 'get',
                data: {
                    assign_id: chat_assing_id
                },
                success: function(response) {
                    var $submit = $(forms.login).find('[type="submit"]').show();

                    if (response.status === true) {
                        $submit.html($submit.data('join-text'));
                    }

                    if (chat_assing_id !== undefined && chat_assing_id !== false) {
                        self.bind();
                    }

                    verify_status(response.status, response.message);
                }
            });
        },
        // Check and validate status, login and more for user with sessions
        check_status: function() {
            if (true === Tienda.Chat.online) {
                save_first_room();
            } else {
                $.post('chat/set_mail/', $(forms.login).serialize(), function(data) {
                    alert('Se ha enviado')
                }, 'json');
            }

            return false;
        },
        // server bind update
        bind: function() {
            var self = Tienda.Chat;
            var ajax = $.ajax({
                url: (domain + urls.update),
                dataType: 'jsonp',
                data: {
                    assign_id: chat_assing_id,
                    first: first,
                    last_id: $('.chat-message:last').data('id')
                },
                type: 'get',
                error: self.bind,
                beforeSend: function(jqXHR) { // before jQuery send the request we will push it to our array
                    $.xhrPool.push(jqXHR);
                },
                success: function(response) {

                    verify_status(response.status, response.message);

                    // Render new messages
                    if (response.messages) {
                        render_new_messages.call(self, response.messages, first);
                        first = false;
                    }

                    if (!response.assign_exists) {
                        self.check_assign();
                        clear_session();
                    }

                    if (response.assign) {
                        if (!response.assign.wait) {
                            show_chat();
                        }
                    }

                    show_message_form();

                    // If room is close then hide message form
                    if (response.is_close) {
                        hide_message_form();

                        setTimeout(function() {
                            clear_session();
                        }, 2000);
                    }

                    return self.bind();
                },
                complete: function(jqXHR) { // when some of the requests completed it will splice from the array
                    var index = $.xhrPool.indexOf(jqXHR);
                    if (index > -1) {
                        $.xhrPool.splice(index, 1);
                    }
                }
            });
        },
        send_message: function() {
            var $form = $(this),
                    data = $form.serialize(),
                    $input = $form.find('[name="message"]'),
                    old_input_placeholder = $input.attr('placeholder'),
                    $icon = $('.iconochat');

            $input.val('');

            $.ajax({
                url: (domain + urls.send_message),
                dataType: 'jsonp',
                data: data + '&assign_id=' + chat_assing_id,
                //
                beforeSend: function() {
                    $input.attr('placeholder', 'Enviando mensaje...');
                    $icon.addClass('message-loading');
                },
                //
                complete: function(response) {
                    $input.attr('placeholder', old_input_placeholder);
                    $icon.removeClass('message-loading');
                }
            });

            return false;
        }
    };

    // === Data API

    $(document).on('submit', forms.login, Tienda.Chat.check_status);
    $(document).on('submit', forms.message, Tienda.Chat.send_message);

    $(document).on('click', toggles.open, show_chat);
    $(document).on('click', toggles.close, hide_chat);

    $(document).on('click', toggles.title_open, function() {
        $(this).attr('data-toggle', 'title-close-chat');
        return show_chat();
    });

    $(document).on('click', toggles.title_close, function() {
        $(this).attr('data-toggle', 'title-open-chat');
        return hide_chat();
    });

    // ==== Run!

    $(function() {
        Tienda.Chat.init();
    });
})(window.jQuery, window.sessionStorage);