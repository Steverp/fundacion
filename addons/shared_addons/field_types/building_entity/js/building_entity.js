(function($) {
    var field = '[data-fieldtype="building-entity"]';

    function get_data() {
        var city_id = $('[name="' + $(this).data('city-name') + '"]').val(),
            value = $(this).data('value');

        if (city_id) {
            $.ajax({
                url: 'streams_core/public_ajax/field/building_entity/get_all_by_city',
                type: 'post',
                dataType: 'json',
                data: {
                    city_id: city_id
                },
                beforeSend: function() {
                    return $(field).empty();
                },
                success: function(data) {
                    if (data) {
                        $.each(data, function(id, name) {
                            var option = $('<option />', {
                                'value': id,
                                'text': name
                            }).appendTo(field);
                            
                            var same = parseInt(value) === parseInt(id);
                            
                            if (same) {
                                option.attr('selected', 'selected');
                            }
                        });
                    }
                },
                complete: function() {
                    return $(field).trigger("liszt:updated").trigger('change');
                }
            });
        }
    }

    $(function() {
        $('[name="' + $(field).data('city-name') + '"]').change(function() {
            get_data.call($(field));
        });

        get_data.call($(field));
    });
})(jQuery);