document.addEventListener("turbolinks:load", function initializeMap() {
  if ($('.admin-nht-invoice-show').length && $('.td-admin-map-invoice').length) {
    markersAdminShowInvoice = [];
    center_default = {lat: 21.0119842, lng: 105.8471442};
    start_latitude = parseFloat($('map-lat0').val());
    start_longitude = parseFloat($('map-lng0').val());
    finish_latitude = parseFloat($('map-lat1').val());
    finish_longitude = parseFloat($('map-lng1').val());

    locations_invoice = [
      {lat: start_latitude, lng: start_longitude},
      {lat: finish_latitude, lng: finish_longitude}
    ];

    infowindow = new google.maps.InfoWindow;
    directionsService = new google.maps.DirectionsService();
    directionsDisplay = new google.maps.DirectionsRenderer();
    mapAdminShowInvoice = new google.maps.Map(document.getElementById('td-admin-map-invoice'), {
      center: center_default,
      zoom: 13,
    });
    bounds = new google.maps.LatLngBounds();

    $('#myModal').on('shown.bs.modal', function () {
      initializeMap();
    });

    for (i = 0; i < locations_invoice.length; i++) {
      marker = addMarkerWithTimeout(i, locations_invoice[i]);
      markersAdminShowInvoice.push(marker);
      if (i) {
        marker.setIcon('../../assets/blue-dot.png');
      } else {
        marker.setIcon('../../assets/red-dot.png');
      }
      bounds.extend(positionToLatLng(marker.getPosition()));
    }

    mapShowInvoice.fitBounds(bounds);
    distance = getDistance(markersAdminShowInvoice[0].getPosition(),
      markersAdminShowInvoice[1].getPosition()).toFixed(2);
    $('#distance_invoice').val(distance);
    directions = {directionsService: directionsService, directionsDisplay: directionsDisplay};
    calcRoute(mapShowInvoice, markersAdminShowInvoice, directions);
  }
});
