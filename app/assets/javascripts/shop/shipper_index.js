document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.hatd-item-actions').on('click', function() {
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.dropdown-toggle.hatd-toggle').html(str);
      $('.hatd-dropdown-menu-actions').slideUp(200);
    });

    $('.hatd-dropdown-actions').on('click', function() {
      if (!$('.hatd-dropdown-menu-actions').is(":visible")) {
        $('.hatd-dropdown-menu-actions').slideDown(200);
      } else {
        $('.hatd-dropdown-menu-actions').slideUp(200);
      }
    });
  });
  event_click_shipper_on_received_list();
  event_click_shipper_on_list();
});

function event_click_shipper_on_received_list(){
  $on_process = false;
  $(document).on('click', '.received_shipper_row', function(event) {
    if(!$on_process){
      show_loading_after();
      $on_process = true;
      id = $(this).data('id');
      invoice_id = $(this).data('invoice-id');
      user_invoice_id = $(this).data('user-invoice-id');
      link_url = '/shippers/' + id + '?invoice_id=' + invoice_id + '&user_invoice_id=' + user_invoice_id;
      ajax_show_shipper(link_url);
    }
  });
}

function event_click_shipper_on_list(){
  $on_process = false;
  $(document).on('click', '.shipper_row', function(event) {
    if(!$on_process){
      show_loading_after();
      $on_process = true;
      id = $(this).data('id');
      link_url = '/shippers/' + id;
      ajax_show_shipper(link_url);
    }
  });
}

function ajax_show_shipper(link_url){
  $.ajax({
    url: link_url,
    method: 'get',
    dataType: 'text'
  }).done(function(data){
    close_loading_after();
    $('#id-nht-invoice-shipper').html(data).modal('show');
    $on_process = false;
  });
}
