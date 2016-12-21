document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.nht-item-status').on('click', function() {
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.dropdown-toggle.nht-toggle').html(str);
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
