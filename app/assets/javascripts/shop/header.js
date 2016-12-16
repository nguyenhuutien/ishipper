document.addEventListener("turbolinks:load", function() {
  if ($('#_profile').length) {
    $('#_profile').on('click', function() {
      if (!$('.dropdown-menu').is(":visible")) {
        $('.dropdown-menu').slideDown(200);
      } else {
        $('.dropdown-menu').slideUp(200);
      }
    });
  }
});
