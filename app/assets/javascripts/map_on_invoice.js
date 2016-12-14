function calcRoute(map, markers, directionsService, directionsDisplay) {
  var start = new google.maps.LatLng(markers[0].getPosition().lat(), markers[0].getPosition().lng());
  var end = new google.maps.LatLng(markers[1].getPosition().lat(), markers[1].getPosition().lng());
  var bounds = new google.maps.LatLngBounds();

  bounds.extend(start);
  bounds.extend(end);
  map.fitBounds(bounds);
  var request = {
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.DRIVING,
  };

  directionsService.route(request, function (response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      directionsDisplay.setOptions( { suppressMarkers: true } );
      directionsDisplay.setMap(map);
    } else {
      alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
    }
  });
}

document.addEventListener("turbolinks:load", function initializeMap() {
  if ($('.nht-invoice-show').length) {
    var markers = [];
    var map;

    var center_default = {lat: 21.0119842, lng: 105.8471442};
    if ($('#map-on-invoice').length > 0) {
      var start_latitude = parseFloat(document.getElementById('map-lat0').value);
      var start_longitude = parseFloat(document.getElementById('map-lng0').value);
      var finish_latitude = parseFloat(document.getElementById('map-lat1').value);
      var finish_longitude = parseFloat(document.getElementById('map-lng1').value);
    }

    var locations_invoice = [
      {lat: start_latitude, lng: start_longitude},
      {lat: finish_latitude, lng: finish_longitude}
    ];
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;

    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();

    function addMarkerWithTimeout(i, position) {
      marker = new google.maps.Marker({
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        position: position,
      });

      var img_start = new Image();
      img_start.src = '../../assets/blue-dot.png';
      var img_finish = new Image();
      img_finish.src = '../../assets/red-dot.png';

      if (i == 0) {
        marker.setIcon(img_start.src);
        marker.setTitle(I18n.t("map_on_invoice.address_start"));
        geocodeLatLng(geocoder, marker.getPosition(), $('#map-address0'));
        $('#map-lat0').val(marker.getPosition().lat());
        $('#map-lng0').val(marker.getPosition().lng());

        google.maps.event.addListener(marker, 'dragend', function(evt){
          $('#map-lat0').val(evt.latLng.lat());
          $('#map-lng0').val(evt.latLng.lng());
          $('#distance_invoice').val(getDistance(evt.latLng, markers[1].getPosition()).toFixed(2));
          geocodeLatLng(geocoder, this.getPosition(), $('#map-address0'));
        });
      } else {
        marker.setIcon(img_finish.src);
        marker.setTitle(I18n.t("map_on_invoice.address_finish"));
        geocodeLatLng(geocoder, marker.getPosition(), $('#map-address1'));
        $('#map-lat1').val(marker.getPosition().lat());
        $('#map-lng1').val(marker.getPosition().lng());

        google.maps.event.addListener(marker, 'dragend', function(evt){
          $('#map-lat1').val(evt.latLng.lat());
          $('#map-lng1').val(evt.latLng.lng());
          $('#distance_invoice').val(getDistance(evt.latLng, markers[0].getPosition()).toFixed(2));
          geocodeLatLng(geocoder, this.getPosition(), $('#map-address1'));
        });
      }
      markers.push(marker);
    }

    function clearMarkers() {
      for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
      }
      markers = [];
    }

    map = new google.maps.Map(document.getElementById('map-on-invoice'), {
      center: center_default,
      zoom: 13,
    });

    $('#myModal').on('shown.bs.modal', function () {
          initializeMap();
      });

    clearMarkers();
    for (var i = 0; i < locations_invoice.length; i++) {
      addMarkerWithTimeout(i, locations_invoice[i]);
    }
    center_default = markers[0].position;
    var distance = getDistance(markers[0].getPosition(), markers[1].getPosition()).toFixed(2);
    $('#distance_invoice').val(distance);
    calcRoute(map, markers, directionsService, directionsDisplay);
  }
});
