document.addEventListener("turbolinks:load", function() {
  $('.td-button-create-invoice').on('click', function() {
    $('.td-create-invoice-form').addClass('block');
    $('.td-create-invoice-form').niceScroll({
      cursorwidth: "6px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: { top: 30},
    });
    $('#map-base').addClass('td-create-invoice-map');
    $('.td-currency').maskMoney({
      allowZero:true,
      suffix: I18n.t('vnd'),
      thousands:',',
      precision: 0
    });
  });
  $('.td-create-invoice-close').on('click', function() {
    $('.td-create-invoice-form').removeClass('block');
    $('#map-base').removeClass('td-create-invoice-map');
  });
  $('.clockpicker').clockpicker();
  $.each($('textarea[data-autoresize]'), function() {
    var offset = this.offsetHeight - this.clientHeight;

    var resizeTextarea = function(el) {
      $(el).css('height', 'auto').css('height', el.scrollHeight + offset);
    };
    $(this).on('keyup input', function() { resizeTextarea(this); }).removeAttr('data-autoresize');
  });
});
