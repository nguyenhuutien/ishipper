document.addEventListener('turbolinks:load', function() {
  $('.lvc-invoice-action').each(function(){
    status = $(this).attr('data-status');
    switch(status){
      case '0':
        $(this).attr('class', "btn btn-default lvc-invoice-action");
        break;
      case '1':
        $(this).attr('class', "btn btn-success lvc-invoice-action");
        break;
      case '2':
        $(this).attr('class', "btn btn-info lvc-invoice-action");
        break;
      case '3':
        $(this).attr('class', "btn btn-primary lvc-invoice-action");
        break;
      case '4':
        $(this).attr('class', "btn btn-warning lvc-invoice-action");
        break;
      case '5':
        $(this).attr('class', "btn btn-danger lvc-invoice-action");
        break;
    }
  });
});
