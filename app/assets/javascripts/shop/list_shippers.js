document.addEventListener('turbolinks:load', function() {
  $('.modal').on('show.bs.modal', function() {
    curModal = this;
    $('.modal').each(function() {
      if (this !== curModal) {
        $(this).modal('hide');
      }
    });
  });
});
