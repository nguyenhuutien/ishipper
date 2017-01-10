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
    event_click_shipper_column();
    event_typed_enter_search();
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

$current_column = null;
function event_click_shipper_column(){
  $('.s-column-info').click(function(){
    event.preventDefault();
    show_loading_after();
    if(this != $current_column){
      reset_shipper_sort_column();
      $current_column = this;
    }
    form = $('#form_search_shipper');
    data = change_data_filter_column($(this).attr('data'), $(this).find('span'), this);
    $(this).attr('data', data);
    $('#add_more_search_shipper').html('<input hidden name="search[column]" value="' + data + '" />');
    $(form).submit();
  });
}

function reset_shipper_sort_column(){
  $('.s-column-info').each(function(){
    $(this).find('span').remove();
    data = $(this).attr('data');
    if(data)
      $(this).attr('data', data.replace('asc', '').replace('desc', ''));
  });
}
