rad = function(x) {
  return x * Math.PI / 180;
};

getDistance = function(p1, p2) {
  R = 6378137;
  dLat = rad(p2.lat() - p1.lat());
  dLong = rad(p2.lng() - p1.lng());
  a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
    Math.sin(dLong / 2) * Math.sin(dLong / 2);
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  d = R * c;
  return d/1000;
};

function geocodeLatLng(position, input) {
  latlng = {lat: position.lat(), lng: position.lng()};
  geocoder = new google.maps.Geocoder;
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === 'OK') {
      if (results[1]) {
        input.val(results[1].formatted_address);
      }
    }
  });
}

function clearMarkers(markers) {
  for (i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}

function addMarkerWithTimeout(map, position) {
  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: position,
  });
  return marker;
}

function calcRoute(map, markers, directions) {
  start = new google.maps.LatLng(markers[0].getPosition().lat(), markers[0].getPosition().lng());
  end = new google.maps.LatLng(markers[1].getPosition().lat(), markers[1].getPosition().lng());
  bounds = new google.maps.LatLngBounds();
  bounds.extend(start);
  bounds.extend(end);
  map.fitBounds(bounds);
  request = {
    origin: start,
    destination: end,
    travelMode: google.maps.TravelMode.DRIVING,
  };
  directionsService = directions.directionsService;
  directionsDisplay = directions.directionsDisplay;

  directionsService.route(request, function (response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      directionsDisplay.setOptions( { suppressMarkers: true } );
      directionsDisplay.setMap(map);
    }
  });
}

function initAutocomplete(map, marker, input) {
  bounds = map.getBounds();
  autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function() {
    place = this.getPlace();
    if (!place.geometry) {
      return;
    }

    position = place.geometry.location;
    if (marker != null) {
      marker.setPosition(position);
    } else {
      marker = new google.maps.Marker({
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP,
        position: position,
      });
    }
    bounds.extend(marker.getPosition());
    window.setTimeout(function() {
      map.panTo(position, 5000);
      map.fitBounds(bounds);
    });
  });
}

function positionToLatLng(position) {
  return {lat: position.lat(), lng: position.lng()};
}
