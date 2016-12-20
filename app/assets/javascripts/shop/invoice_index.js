document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.nht-item-status').on('click', function() {
      $('.dropdown-toggle').html($(this)[0].innerText);
      $('.nht-dropdown-menu-status').slideUp(200);
    });

    $('.nht-dropdown-status').on('click', function() {
      if (!$('.nht-dropdown-menu-status').is(":visible")) {
        $('.nht-dropdown-menu-status').slideDown(200);
      } else {
        $('.nht-dropdown-menu-status').slideUp(200);
      }
    });
  });
});
