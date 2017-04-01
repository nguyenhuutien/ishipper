function addShipper(map, addresses) {
  bounds = new google.maps.LatLngBounds();
  for (i = 0; i < addresses.length; i++) {
    position = {lat: addresses[i].latitude, lng: addresses[i].longitude};
    img = new Image();
    if (addresses[i].online) {
      img.src = '../../assets/online-shipper.png';
    } else {
      img.src = '../../assets/offline-shipper.png';
    }

    marker = new google.maps.Marker({
      map: map,
      animation: google.maps.Animation.DROP,
      position: position,
      icon: img.src,
      user_id: addresses[i].id,
      title: addresses[i].name,
      user_name: addresses[i].name,
      user_phone_number: addresses[i].phone_number,
      user_rate: addresses[i].rate,
      user_sum_rate: addresses[i].sum_rate,
      user_rate_five: addresses[i].load_five_star,
      user_rate_four: addresses[i].load_four_star,
      user_rate_three: addresses[i].load_three_star,
      user_rate_two: addresses[i].load_two_star,
      user_rate_one: addresses[i].load_one_star,
      user_role: addresses[i].role,
      user_email: addresses[i].email,
      user_address: addresses[i].address
    });

    marker.addListener('click', function() {
      avatar = document.getElementById('nht-user-avatar');
      avatar.src = '../../assets/profile.jpg';
      $('.nht-user_name').html(this.user_name);
      $('.nht-user_phone_number').html(this.user_phone_number);
      $('.nht-user_rate').html(this.user_rate);
      $('.nht-user_sum_rate').html(this.user_sum_rate);
      $('.nht-user_rate_five').html(this.user_rate_five);
      $('.nht-user_rate_four').html(this.user_rate_four);
      $('.nht-user_rate_three').html(this.user_rate_three);
      $('.nht-user_rate_two').html(this.user_rate_two);
      $('.nht-user_rate_one').html(this.user_rate_one);
      $('.nht-user_address').html(this.user_address);
      $('.nht-user_email').html(this.user_email);
      $('.nht-user_role').html(this.user_role);
      $('#user-map').modal();
    });

    bounds.extend(positionToLatLng(marker.getPosition()));
  }
  map.fitBounds(bounds);
}

document.addEventListener("turbolinks:load", function() {
  if ($('.nht-list-shippers').length) {
    center_default = {lat: 21.0119842, lng: 105.8471442};
    mapListShippers = new google.maps.Map(document.getElementById('map-list-shippers'), {
      center: center_default,
      zoom: 13,
    });

    addresses = $('.address-list-shippers').data('address-list-shippers');
    address_invoice = $('.address-invoice').data('address-invoice');
    position = {lat: address_invoice.latitude_start, lng: address_invoice.longitude_start};
    marker = new google.maps.Marker({
      map: mapListShippers,
      animation: google.maps.Animation.DROP,
      position: position,
      icon: '../../assets/blue-dot.png'
    });

    addShipper(mapListShippers, addresses);
  }
});
