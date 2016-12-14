var rad = function(x) {
  return x * Math.PI / 180;
};

var getDistance = function(p1, p2) {
  var R = 6378137;
  var dLat = rad(p2.lat() - p1.lat());
  var dLong = rad(p2.lng() - p1.lng());
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(rad(p1.lat())) * Math.cos(rad(p2.lat())) *
    Math.sin(dLong / 2) * Math.sin(dLong / 2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  return d/1000;
};

// Chuyen 1 postion ve 1 address
function geocodeLatLng(position, input) {
  var latlng = {lat: position.lat(), lng: position.lng()};
  var geocoder = new google.maps.Geocoder;
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === 'OK') {
      if (results[1]) {
        input.val(results[1].formatted_address);
      } else {
        window.alert('No results found');
      }
    } else {
      window.alert('Geocoder failed due to: ' + status);
    }
  });
}

// Ve duong di
function drawLine(latLng1, latLng2) {
  var line = new google.maps.Polyline({
    path: [latLng1, latLng2],
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 10,
    geodesic: true,
  });

  line.setMap(map);
}

// Auto complete khi nhap dia chi
function initAutocomplete() {
  var input0 = document.getElementById('map-address0');
  var searchBox0 = new google.maps.places.SearchBox(input0);

  searchBox0.addListener('places_changed', function() {
    places = searchBox0.getPlaces();
    if (places.length == 0) {
      return;
    }
    places.forEach(function(place) {
      if (!place.geometry) {
        return;
      }
      position = {lat: place.geometry.location.lat(), lng: place.geometry.location.lng()};
      markers[0].setPosition(position);
      window.setTimeout(function() {
        map.panTo(markers[0].getPosition(), 5000);
        map.setZoom(15);
      });
    });
  });

  input1 = document.getElementById('map-address1');
  searchBox1 = new google.maps.places.SearchBox(input1);

  searchBox1.addListener('places_changed', function() {
    places = searchBox1.getPlaces();
    if (places.length == 0) {
      return;
    }

    places.forEach(function(place) {
      if (!place.geometry) {
        return;
      }
      position = {lat: place.geometry.location.lat(), lng: place.geometry.location.lng()};
      markers[1].setPosition(position);
      window.setTimeout(function() {
        map.panTo(markers[1].getPosition(), 5000);
        map.setZoom(15);
      });
    });
  });
}

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

function clearMarkers(markers) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}

function addMarkerWithTimeout(map, markers, position, i, directionsService, directionsDisplay) {
  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: position,
  });

  var img_start = new Image();
  img_start.src = '../../assets/blue-dot.png';
  var img_finish = new Image();
  img_finish.src = '../../assets/red-dot.png';

  if (i == 0) {
    marker.setIcon(img_start.src);
    marker.setTitle('Address start');
    address = geocodeLatLng(marker.getPosition(), $('#map-address0'));
    $('#map-lat0').val(marker.getPosition().lat());
    $('#map-lng0').val(marker.getPosition().lng());

    google.maps.event.addListener(marker, 'dragend', function(evt){
      $('#map-lat0').val(evt.latLng.lat());
      $('#map-lng0').val(evt.latLng.lng());
      $('#distance_invoice').val(getDistance(evt.latLng, markers[1].getPosition()).toFixed(2));
      address = geocodeLatLng(marker.getPosition(), $('#map-address0'));
      calcRoute(map, markers, directionsService, directionsDisplay);
    });

  } else {
    marker.setIcon(img_finish.src);
    marker.setTitle('Address finish');

    address = geocodeLatLng(marker.getPosition(), $('#map-address1'));
    $('#map-lat1').val(marker.getPosition().lat());
    $('#map-lng1').val(marker.getPosition().lng());

    google.maps.event.addListener(marker, 'dragend', function(evt){
      $('#map-lat1').val(evt.latLng.lat());
      $('#map-lng1').val(evt.latLng.lng());
      $('#distance_invoice').val(getDistance(evt.latLng, markers[0].getPosition()).toFixed(2));
      address = geocodeLatLng(marker.getPosition(), $('#map-address1'));
      calcRoute(map, markers, directionsService, directionsDisplay);
    });
  }

  markers.push(marker);
}

document.addEventListener("turbolinks:load", function() {
  if ($('#nht-form-invoice-new').length) {
    var markers = [];
    var map;
    var center_default = {lat: 21.0119842, lng: 105.8471442};
    var locations_default = [
      {lat: 21.0119842, lng: 105.8471442},
      {lat: 21.0090146, lng: 105.8577783}
    ];

    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();

    map = new google.maps.Map(document.getElementById('map'), {
      center: center_default,
      zoom: 13,
    });


    clearMarkers(markers);
    for (var i = 0; i < locations_default.length; i++) {
      addMarkerWithTimeout(map, markers, locations_default[i], i, directionsService, directionsDisplay);
    }
    center_default = markers[0].position;
    var distance = getDistance(markers[0].getPosition(), markers[1].getPosition()).toFixed(2);
    $('#distance_invoice').val(distance);
    calcRoute(map, markers, directionsService, directionsDisplay);
  }
});
