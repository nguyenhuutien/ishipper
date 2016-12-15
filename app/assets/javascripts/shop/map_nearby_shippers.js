function addNearbyShippers(map, listShippers) {
  infowindow = new google.maps.InfoWindow();
  for (i = 0; i < listShippers.length; i++) {
    position = {lat: listShippers[i].latitude, lng: listShippers[i].longitude};
    icon = new Image();
    if (listShippers[i].online) {
      icon.src = '../../assets/online-shipper.png';
    } else {
      icon.src = '../../assets/offline-shipper.png';
    }
    marker = new google.maps.Marker({
      map: map,
      animation: google.maps.Animation.DROP,
      position: position,
      icon: icon.src,
      nameShipper: listShippers[i].name
    });

    marker.addListener('click', function() {
      infowindow.setContent(this.nameShipper);
      infowindow.open(map, this);
    });
  }
}

document.addEventListener("turbolinks:load", function() {
  if ($('.nht-nearby-shippers').length) {
    listShippers = $('.list_shippers').data('list_shippers');
    addressShop = $('.address_shop').data('address_shop');
    locations_default = {lat: addressShop.latitude, lng: addressShop.longitude};
    iconShop = new Image();
    iconShop.src = '../../assets/shop.png';
    mapNearByShippers = new google.maps.Map(document.getElementById('map_nearby_shippers'), {
      center: locations_default,
      zoom: 13,
    });

    marker = addMarkerWithTimeout(mapNearByShippers, locations_default);
    marker.setIcon(iconShop.src);
    infowindow = new google.maps.InfoWindow();
    marker.addListener('click', function() {
      infowindow.setContent(I18n.t("map_nearby_shippers.your_location"));
      infowindow.open(mapNearByShippers, this);
    });

    $('#nht-search-address-input').on('keyup', function() {
      initAutocomplete(mapNearByShippers, marker, $(this)[0]);
    });

    addNearbyShippers(mapNearByShippers, listShippers);
  }
});
