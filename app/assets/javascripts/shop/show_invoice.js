document.addEventListener('turbolinks:load', function(){
  $(document).on('click', '.lvc-sidebar-button', function(event) {
    $list_back_status = $(this).attr('status');
  });

  $(document).on('click', '.lvc-invoice-confirm', function(event) {
    data = $(this).attr('data');
    if(data == '1'){
      $('#id-lvc-invoices-confirm').modal('toggle');
      $('form[class=edit_invoice]').submit();
    }
    else{
      $('#id-lvc-invoices-confirm').modal('toggle');
    }
  });
  event_click_invoice_on_list();
  action_update_status_invoice();
  event_close_show_invoice();
});

function action_update_status_invoice(){
  $(document).on('click', '.invoice-status-change', function(event) {
    event.preventDefault();
    $('#id-lvc-invoices-confirm').modal({backdrop: 'static',
      keyboard: false, show: true});
  });
}

function event_close_show_invoice(){
  $(document).on('click', '.dis-invoice-modal', function(event) {
    event.preventDefault();
    $invoice_show.modal('toggle');
    $('#id-nht-invoices-index').modal('show');
  });
}

function event_click_invoice_on_list(){
  $list_back_status = 'all';
  $on_process = false;
  $(document).on('click', '.shop_invoice_row', function(event) {
    if(!$on_process){
      $('#id-nht-invoices-index').modal('toggle');
      $invoice_show = $('#id-lvc-invoices-show').html('<div class="uil-reload-css"><div>');
      $invoice_show.modal({
        backdrop: 'static', keyboard: false, show: true});
      $on_process = true;
      id = $(this).attr('id');
      ajax_show_invoice(id);
    }
  });
}

function ajax_show_invoice(id){
  $.ajax({
    url: '/shop/invoices/' + id + '?list_back_status=' + $list_back_status,
    method: 'get',
    dataType: 'text'
  }).done(function(data){
    $('#id-lvc-invoices-show').html(data);
    $on_process = false;
  });
}
