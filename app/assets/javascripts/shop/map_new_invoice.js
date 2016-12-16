document.addEventListener("turbolinks:load", function() {
  if ($('#nht-form-invoice-new').length) {
    markersNewInvoice = [];
    center_default = {lat: 21.0119842, lng: 105.8471442};
    locations_default = [
      {lat: 21.0119842, lng: 105.8471442},
      {lat: 21.0090146, lng: 105.8577783}
    ];
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    bounds = new google.maps.LatLngBounds();

    mapNewInvoice = new google.maps.Map(document.getElementById('map-new-invoice'), {
      center: center_default,
      zoom: 13,
    });

    clearMarkers(markers);
    for (i = 0; i < locations_default.length; i++) {
      marker = addMarkerWithTimeout(mapNewInvoice, locations_default[i]);
      markersNewInvoice.push(marker);
      if (i) {
        marker.setIcon('../../assets/blue-dot.png');
      } else {
        marker.setIcon('../../assets/red-dot.png');
      }
      bounds.extend(positionToLatLng(marker.getPosition()));
    }

    mapShowInvoice.fitBounds(bounds);
    distance = getDistance(markersNewInvoice[0].getPosition(),
      markersNewInvoice[1].getPosition()).toFixed(2);

    $('#distance_invoice').val(distance);
    directions = {directionsService: directionsService, directionsDisplay: directionsDisplay};
    calcRoute(mapNewInvoice, markersNewInvoice, directions);
  }
});
