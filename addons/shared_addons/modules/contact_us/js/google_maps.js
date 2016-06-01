/*
 * @author Luis Fernando Salazar
 * @description 
 */
    
jQuery(function($) {
    // Asynchronously Load the map API 
    var base_url = $('#baseurl').html();  // seleccionamos la base url de un div    
    var script = document.createElement('script');
    script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
    document.body.appendChild(script);
    
    
    $(document).on("change", "#changeGoogleMap", function(event)
    {
        $.ajax({
            url: base_url+'google_maps/multiple_poins/',
            type: 'POST',
            dataType : 'json',
            data: ({idcategory: $(this).val()}),
            beforeSend: function ()
            {
                $('#map_loader').html('<img src="'+base_url+'uploads/default/loading.gif" width="28" height="28" class="img_loadig" />');
            },
            success: function(data)
            {
                $('#map_loader').empty();
                if(data.status == 'error')
                {
                    alert(data.msg);
                }
                else
                {
                    $('#json_markers').html(data.json_markers);
                    $('#json_info_content').html(data.json_info_content);
                    script = document.createElement('script');
                    script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
                    document.body.appendChild(script);
                }
            },
            error: function(err)
            {
                alert("Ocurrió un error. Por favor inténtelo de nuevo.");
            }
        });
    });
});

function initialize() {
    var base_url = $('#baseurl').html();  // seleccionamos la base url de un div  
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
    
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);
    
    json_markers = JSON.parse($('#json_markers').html());
    
    // Multiple Markers
    var markers = json_markers;
    
    json_info_content = JSON.parse($('#json_info_content').html());
    
    // Info Window Content
    var infoWindowContent = [];
    
    i = 0;
    $.each( json_info_content, function( row, value )
    {
        infoWindowContent.push(['<div class="info_content">  <img src="' + base_url+ 'uploads/default/' +value['moduleName'] + '/' + value['image'] + '" ><div> <span>Horarios:</span></div> <div class"info3">' + value['schedule'] + '</div> <div> <span>Nombre: </span>' + value['title'] + '</div> <div> <span>Dirección: </span> ' + value['adress'] + '</div> <div><span>Información: </span> ' + value['description'] + '</div> </div>'] );
        i++;
    });
    
    console.log(infoWindowContent);
        
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });
        
        // Allow each marker to have an info window    
//        google.maps.event.addListener(marker, 'click', (function(marker, i) {
//            return function() {
//                infoWindow.setContent(infoWindowContent[i][0]);
//                infoWindow.open(map, marker);
//            }
//        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(14);
        google.maps.event.removeListener(boundsListener);
    });
    
}