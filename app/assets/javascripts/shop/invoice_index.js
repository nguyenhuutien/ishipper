document.addEventListener("turbolinks:load", function() {
  $('#id-nht-invoices-index').on('shown.bs.modal', function () {
    $('.nht-item-status').on('click', function() {
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.nht-toggle').html(str);
      str = $(this)[0].innerText + ' invoices';
      str = str.toUpperCase();
      $('.nht-invoices-status').html(str);
      $('.nht-dropdown-menu-status').slideUp(200);
    });

    $('.nht-toggle').on('click', function() {
      $('.nht-dropdown-menu-status').slideDown(200);
    });
  });
});
