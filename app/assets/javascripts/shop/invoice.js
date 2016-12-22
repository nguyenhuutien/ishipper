document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.close').on('click', function() {
      $('.modal').each(function() {
        $(this).modal('hide');
      });
      $('.modal-backdrop').remove();
    });
  });
});
