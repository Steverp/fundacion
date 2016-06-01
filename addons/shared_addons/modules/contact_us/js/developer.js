/* 
 
 * @author Brayan Acebo
 
 * @description Javascript/ajax necesario para funciones de programación
 
 */





// Escapa todos los caracteres "extraños" para envio post y validación

// codeigniter



function escapeHtml(unsafe) {

    return unsafe

            .replace(/&/g, "&amp;")

            .replace(/</g, "&lt;")

            .replace(/>/g, "&gt;")

            .replace(/"/g, "&quot;")

            .replace(/'/g, "&#039;")

            .replace(/#/g, "&#035;")

            .replace(/:/g, "&#058;");

}




// Edita campo oculto para el texto wysiwyg que se envia por post

$(document).on("submit", "#form-wysiwyg", function() {

    $('#text').val(escapeHtml($('#text-wysiwyg').val()));
    $('#map').val(escapeHtml($('#text-wysiwyg-map').val()));

});

$(function() {

    var lat = $('#lat').val();
    var log = $('#lng').val();
    setTimeout(function() {
        initialize(lat, log);
    }, 200)
    $("#geocomplete").bind("geocode:dragged", function(event, latLng) {
        $("input[name=coordinate1]").val(latLng.lat());
        $("input[name=coordinate2]").val(latLng.lng());
    });

    $("#find").click(function() {
        $("#geocomplete").trigger("geocode");
    }).click();
});

function initialize(lat, log) {
    var center = new google.maps.LatLng(lat, log);
    $("#geocomplete").geocomplete({
        map: ".map_canvas",
        details: "form",
        location: center,
        markerOptions: {
            draggable: true,
//            icon: 'http://software.imaginamos.com/miketeam/web/monte-azul/uploads/default/logo-maps.png'
        }
    });


    var map = $("#geocomplete").geocomplete("map")
    map.setCenter(center);
    map.setZoom(15);
}







