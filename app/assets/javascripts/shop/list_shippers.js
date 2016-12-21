document.addEventListener('turbolinks:load', function() {
  $('.modal').on('show.bs.modal', function() {
    curModal = this;
    $('.modal').each(function() {
      if (this !== curModal) {
        if(!($(this).attr('id') == 'id-lvc-invoices-show' &&
          $(curModal).attr('id') == 'id-lvc-invoices-confirm'))
          $(this).modal('hide');
      }
    });
  });
});
