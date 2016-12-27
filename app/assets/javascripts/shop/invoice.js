document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.close').on('click', function(event) {
      event.preventDefault();
      $('.modal').each(function() {
        $(this).modal('hide');
      });
      $('.modal-backdrop').remove();
      reset_reload_data();
    });
  });
});
