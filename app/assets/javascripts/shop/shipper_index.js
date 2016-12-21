document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.hatd-item-actions').on('click', function() {
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.dropdown-toggle.hatd-toggle').html(str);
      $('.hatd-dropdown-menu-actions').slideUp(200);
    });

    $('.hatd-dropdown-actions').on('click', function() {
      if (!$('.hatd-dropdown-menu-actions').is(":visible")) {
        $('.hatd-dropdown-menu-actions').slideDown(200);
      } else {
        $('.hatd-dropdown-menu-actions').slideUp(200);
      }
    });
  });
});
