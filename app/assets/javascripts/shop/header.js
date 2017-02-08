document.addEventListener("turbolinks:load", function() {
  if ($('#_profile').length) {
    $('#_profile').on('click', function() {
      setTimeout(function(){
        $('.nht-up-arrow').removeClass('block');
      }, 200);
      $('.nht-notifications').slideUp(400);
      if (!$('.dropdown-menu').is(":visible")) {
        $('.dropdown-menu').slideDown(400);
        setTimeout(function(){
          $('.nht-dropdown:before').addClass('block');
        }, 200);
      } else {
        $('.dropdown-menu').slideUp(200);
        $('.nht-dropdown:before').removeClass('block');
      }
    });
  }

  $(document).mouseup(function (e) {
    containers = [$('.nht-dropdown'), $('.nht-notifications'),
      $('.nht-dropdown-menu-invoices-status'), $('.hatd-dropdown-menu-actions')];
    $.each(containers, function (index, value) {
      if (!value.is(e.target) && value.has(e.target).length === 0) {
        value.hide();
      }
    });
  });
});
