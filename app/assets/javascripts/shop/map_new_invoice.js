function addMarker(map, marker) {
  marker.setMap(map);
}

document.addEventListener("turbolinks:load", function() {
  $('.td-button-create-invoice').on('click', function() {
    clearMarkers(markersNearbyShippers);
    markersNewInvoice = [];
    center_default = {lat: 21.0119842, lng: 105.8471442};
    locations_default = [
      {lat: 21.0119842, lng: 105.8471442},
      {lat: 21.0090146, lng: 105.8577783}
    ];
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    bounds = new google.maps.LatLngBounds();

    for (i = 0; i < locations_default.length; i++) {
      marker = addMarkerWithTimeout(mapBase, locations_default[i]);
      markersNewInvoice.push(marker);
      if (i) {
        marker.setIcon('../../assets/blue-dot.png');
      } else {
        marker.setIcon('../../assets/red-dot.png');
      }
      bounds.extend(positionToLatLng(marker.getPosition()));
    }

    mapBase.fitBounds(bounds);
    distance = getDistance(markersNewInvoice[0].getPosition(),
      markersNewInvoice[1].getPosition()).toFixed(2);

    $('#distance_invoice').val(distance);
    directions = {directionsService: directionsService, directionsDisplay: directionsDisplay};
    calcRoute(mapBase, markersNewInvoice, directions);
    geocodeLatLng(markersNewInvoice[0].getPosition(), $('#td-shop-address-input'));
    geocodeLatLng(markersNewInvoice[1].getPosition(), $('#td-customer-address-input'));

    $('#td-invoice-latitude_start').val(locations_default[0].lat);
    $('#td-invoice-longitude_start').val(locations_default[0].lng);
    $('#td-invoice-latitude_finish').val(locations_default[1].lat);
    $('#td-invoice-longitude_finish').val(locations_default[1].lng);


    $('#td-shop-address-input').on('keyup', function() {
      initAutocomplete(mapBase, markersNewInvoice[0], $(this)[0]);
      google.maps.event.addListener(markersNewInvoice[0], 'position_changed', function(evt){
        $('#td-invoice-latitude_start').val(this.getPosition().lat);
        $('#td-invoice-longitude_start').val(this.getPosition().lng);
        $('#distance_invoice').val(getDistance(this.getPosition(), markersNewInvoice[1].getPosition()).toFixed(2));
        geocodeLatLng(this.getPosition(), $('#td-shop-address-input'));
        calcRoute(mapBase, markersNewInvoice, directions);
      });
    });

    $('#td-customer-address-input').on('keyup', function() {
      initAutocomplete(mapBase, markersNewInvoice[1], $(this)[0]);
      google.maps.event.addListener(markersNewInvoice[1], 'position_changed', function(evt){
        $('#td-invoice-latitude_finish').val(this.getPosition().lat);
        $('#td-invoice-longitude_finish').val(this.getPosition().lng);
        $('#distance_invoice').val(getDistance(this.getPosition(), markersNewInvoice[0].getPosition()).toFixed(2));
        geocodeLatLng(this.getPosition(), $('#td-customer-address-input'));
        calcRoute(mapBase, markersNewInvoice, directions);
      });
    });

    google.maps.event.addListener(markersNewInvoice[0], 'dragend', function(evt){
      $('#td-invoice-latitude_start').val(evt.latLng.lat());
      $('#td-invoice-longitude_start').val(evt.latLng.lng());
      $('#distance_invoice').val(getDistance(evt.latLng, markersNewInvoice[1].getPosition()).toFixed(2));
      geocodeLatLng(this.getPosition(), $('#td-shop-address-input'));
      calcRoute(mapBase, markersNewInvoice, directions);
    });

    google.maps.event.addListener(markersNewInvoice[1], 'dragend', function(evt){
      $('#td-invoice-latitude_finish').val(evt.latLng.lat());
      $('#td-invoice-longitude_finish').val(evt.latLng.lng());
      $('#distance_invoice').val(getDistance(evt.latLng, markersNewInvoice[0].getPosition()).toFixed(2));
      geocodeLatLng(this.getPosition(), $('#td-customer-address-input'));
      calcRoute(mapBase, markersNewInvoice, directions);
    });

  });

  $('.td-create-invoice-close').on('click', function() {
    clearMarkers(markersNewInvoice);
    bounds = new google.maps.LatLngBounds();
    for( i = 0; i < markersNearbyShippers.length; i++ ) {
      addMarker(mapBase, markersNearbyShippers[i]);
      bounds.extend(positionToLatLng(markersNearbyShippers[i].getPosition()));
    }
    mapBase.fitBounds(bounds);
    directionsDisplay.setMap(null);
  });
});
