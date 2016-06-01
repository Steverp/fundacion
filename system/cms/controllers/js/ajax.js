/*
 * @author Luis Fernando Salazar
 * @description 
 */
$(document).ready(function()
{
    var base_url = $('#baseurl').html();  // seleccionamos la base url de un div

    $(document).on("click", ".view_message", function(event)
    {
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: base_url + $(this).attr('href'),
            beforeSend: function() {
                $("#cboxContent").html('<img src="' + base_url + 'uploads/default/loading.gif" width="28" height="28"/>');
            },
            success: function(html) {
                $("#cboxContent").html(html);
            },
            error: function(err)
            {
                alert("Ocurrió un error. Por favor inténtelo de nuevo.");
            }
        });
    });

});