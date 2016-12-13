document.addEventListener("turbolinks:load", function() {
  if ($('#td-latitude').length) {
    var td_latitude = parseFloat(document.getElementById('td-latitude').value);
    var td_longitude = parseFloat(document.getElementById('td-longitude').value);
    var position_profile = {lat: td_latitude, lng: td_longitude};
    var center_default = {lat: 21.0119842, lng: 105.8471442};
    position = position_profile;
    map = new google.maps.Map(document.getElementById('map-profile'), {
      center: center_default,
      zoom: 15,
    });
    map.setCenter(position);
    marker = new google.maps.Marker({
      map: map,
      animation: google.maps.Animation.DROP,
      position: position,
    });
    var img = new Image();
    img.src = '../../assets/blue-dot.png';
    marker.setIcon(img.src);
  }
});
