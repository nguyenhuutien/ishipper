document.addEventListener("turbolinks:load", function() {
  $('#id-nht-invoices-index').on('shown.bs.modal', function () {
    $('.nht-item-invoices-status').on('click', function() {
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.nht-dropdown-toggle-invoices-status').html(str);
      str = $(this)[0].innerText + ' invoices';
      str = str.toUpperCase();
      $('.nht-invoices-title').html(str);
      $('.nht-dropdown-menu-invoices-status').slideUp(200);
    });

    $('.nht-dropdown-invoices-status').on('click', '.nht-dropdown-toggle-invoices-status', function() {
      $('.nht-dropdown-menu-invoices-status').slideDown(200);
    });
  });
});
