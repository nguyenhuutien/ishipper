document.addEventListener("turbolinks:load", function() {
  if ($('#_profile').length) {
    $('.td-a').on('click', function() {
      setTimeout(function(){
        $('.nht-up-arrow').removeClass('block');
      }, 200);
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
    containers = [$('.td-notification-index-icon'), $('.td-a'),
      $('.nht-dropdown-toggle-invoices-status'), $('.hatd-toggle')];
    $.each(containers, function (index, value) {
      if (!value.is(e.target) && value.has(e.target).length === 0 &&
        !value.next().is(e.target.parentElement)) {
        value.removeClass('fa-globe-focus');
        value.next().hide();
      }
    });
  });
});
