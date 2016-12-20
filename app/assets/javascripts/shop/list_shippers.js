document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function() {
    $('.nht-shippers-close').on('click', function() {
      $('#id-nht-invoices-index').modal('show');
    });

    $('.nht-shipper-close').on('click', function() {
      $('#id-nht-invoice-shippers').modal('show');
    });

    $('#nht-invoice-list-shippers-btn').on('click', function() {
      $('#id-nht-invoices-index').modal('hide');
    });

    $('.nht-shipper').on('click', function() {
      $('#id-nht-invoice-shippers').modal('hide');
    });
  });
});
