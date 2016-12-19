document.addEventListener("turbolinks:load", function() {
  $('.td-button-create-invoice').on('click', function() {
    $('.td-create-invoice-form').addClass('block');
  });
  $('.td-create-invoice-close').on('click', function() {
    $('.td-create-invoice-form').removeClass('block');
  });
});
