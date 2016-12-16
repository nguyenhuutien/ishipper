document.addEventListener("turbolinks:load", function initializeMap() {
  if ($('.nht-invoice-show').length && $('#map-show-invoice').length) {
    markersShowInvoice = [];
    center_default = {lat: 21.0119842, lng: 105.8471442};
    start_latitude = parseFloat($('#map-lat0').val());
    start_longitude = parseFloat($('#map-lng0').val());
    finish_latitude = parseFloat($('#map-lat1').val());
    finish_longitude = parseFloat($('#map-lng1').val());

    locations_invoice = [
      {lat: start_latitude, lng: start_longitude},
      {lat: finish_latitude, lng: finish_longitude}
    ];

    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();

    mapShowInvoice = new google.maps.Map(document.getElementById('map-show-invoice'), {
      center: center_default,
      zoom: 13,
    });
    bounds = new google.maps.LatLngBounds();

    $('#myModal').on('shown.bs.modal', function () {
      initializeMap();
    });

    for (i = 0; i < locations_invoice.length; i++) {
      marker = addMarkerWithTimeout(mapShowInvoice, locations_invoice[i]);
      markersShowInvoice.push(marker);
      if (i) {
        marker.setIcon('../../assets/blue-dot.png');
      } else {
        marker.setIcon('../../assets/red-dot.png');
      }
      bounds.extend(positionToLatLng(marker.getPosition()));
    }

    mapShowInvoice.fitBounds(bounds);
    distance = getDistance(markersShowInvoice[0].getPosition(),
      markersShowInvoice[1].getPosition()).toFixed(2);
    $('#distance_invoice').val(distance);
    directions = {directionsService: directionsService, directionsDisplay: directionsDisplay};
    calcRoute(mapShowInvoice, markersShowInvoice, directions);
  }
});
