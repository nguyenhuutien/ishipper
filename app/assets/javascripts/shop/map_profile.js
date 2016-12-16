document.addEventListener("turbolinks:load", function() {
  if ($('.nht-profile').length) {
    td_latitude = parseFloat($('#td-latitude').val());
    td_longitude = parseFloat($('#td-longitude').val());
    position_profile = {lat: td_latitude, lng: td_longitude};
    mapProfile = new google.maps.Map(document.getElementById('map-profile'), {
      center: position_profile,
      zoom: 15,
    });

    marker = new google.maps.Marker({
      map: mapProfile,
      animation: google.maps.Animation.DROP,
      position: position_profile,
      icon: '../../assets/blue-dot.png'
    });
  }
});
