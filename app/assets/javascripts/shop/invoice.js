document.addEventListener('turbolinks:load', function() {
  $('.close').on('click', function() {
    $('.modal').each(function() {
      $(this).modal('hide');
    });
  });
});
