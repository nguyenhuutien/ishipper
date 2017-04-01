document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.hatd-item-actions').on('click', function() {
      $current_shipper_type = $(this).attr('data');
      $('#add_more_type_shipper').html('<input name="type" value="' + $current_shipper_type + '" />');
      str = '<b>' + $(this)[0].innerText +'</b>';
      str += '<b class="caret"></b>';
      $('.dropdown-toggle.hatd-toggle').html(str);
      $('.hatd-dropdown-menu-actions').slideUp(200);
      $('#form-search-shipper').submit();
    });

    $('.hatd-dropdown-actions').on('click', function() {
      if (!$('.hatd-dropdown-menu-actions').is(":visible")) {
        $('.hatd-dropdown-menu-actions').slideDown(200);
      }
    });
    event_enter_shipper_search();
  });
  event_click_shipper_column();
  prepare_shipper_variable();
  event_click_shipper_on_received_list();
  event_click_shipper_on_list();
});

function prepare_shipper_variable(){
  $current_shipper_type = 'list_shipper_received';
  $list_shipper_page = 1;
  $on_load_shipper = false;
  $shipper_searched_query = '';
}

function on_load_more_shipper() {
  $('.load-more-shipper').scroll(function () {
    if ($(this)[0].scrollHeight - $(this).scrollTop() <  $(this).outerHeight() + 5) {
      if(!$on_load_shipper && ($list_shipper_page + 1) <= $max_page_list) {
        $list_shipper_page = $list_shipper_page + 1;
        $on_load_shipper = true;
        $('#shipper_search_query').val($shipper_searched_query);
        $('#add_more_page_shipper').html('<input hidden name="page" value="' + $list_shipper_page + '" />');
        $('#add_more_loadmore_shipper').html('<input hidden name="load_more" value=1 />');
        $('#form-search-shipper').submit();
      }
    }
  });
}

function event_click_shipper_on_received_list(){
  $on_process = false;
  $(document).on('click', '.received_shipper_row', function(event) {
    if(!$on_process){
      show_loading_after();
      $on_process = true;
      id = $(this).data('id');
      shipper_id = $(this).data('shipper-id');
      user_shipper_id = $(this).data('user-shipper-id');
      link_url = '/shippers/' + id + '?shipper_id=' + shipper_id + '&user_shipper_id=' + user_shipper_id;
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
  $(document).on('click', '.s-column-info', function(){
    event.preventDefault();
    show_loading_after();
    $list_shipper_page = 1;
    $('#add_more_page_shipper').html('');
    $('#add_more_loadmore_shipper').html('');
    if(this != $current_column){
      reset_shipper_sort_column();
      $current_column = this;
    }
    form = $('#form-search-shipper');
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

function event_enter_shipper_search(){
  $('#search_shipper_query').keydown(function(e){
    if(e.which == 13) {
      e.preventDefault();
      reset_shipper_search();
      reset_shipper_sort_column();
      $shipper_searched_query = $('#search_shipper_query').val();
      $('#add_more_status_shipper').html('<input name="type" value="' + $current_shipper_type + '" />');
      $(this).parent().submit();
    }
  });
}

function reset_shipper_search(){
  $list_shipper_page = 1;
  $('#add_more_loadmore_shipper').html('');
  $('#add_more_column_shipper').html('');
  $('#add_more_status_shipper').html('');
  $('#add_more_page_shipper').html('');
}
