<div class="one_full">
    <section class="title">
        <h4>Disponibles</h4>
    </section>

    <section class="item">
        <div id="chat-rooms" class="content"></div>
    </section>
</div>

<div class="one_full">
    <section class="title">
        <h4>Activas</h4>
    </section>

    <section class="item">
        <div id="chat-rooms-active" class="content"></div>
    </section>
</div>


<script>
    var $content = $('#chat-rooms'),
        $content_active = $('#chat-rooms-active');

    function check_last() {
        $.ajax({
            url: <?= json_encode(site_url('admin/chat/assign/last_rooms_without_assign')) ?>,
            data: {
                "filter-assign": 'Filtrar',
                "is-front": 1
            },
            dataType: 'json',
            type: 'get',
            success: function(response) {
                if (response.wait_table) {
                    $content.html(response.wait_table);
                    $('.join-assign').attr('target', '_blank');
                }

                if (response.active_table) {
                    $content_active.html(response.active_table);
                    $('.join-assign').attr('target', '_blank');
                }

                return setTimeout(check_last, 10000);
            }
        });
    }

    $(function() {
        check_last();
    });
</script>