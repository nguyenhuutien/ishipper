document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.div-table-content').niceScroll({
      cursorwidth: "10px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: {top: 0},
    });

    $('.modal-content .form').niceScroll({
      cursorwidth: "10px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: {top: 0},
    });

    $('.nht-invoice-detail-box').niceScroll({
      cursorwidth: "10px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: {top: 0},
    });

    $('.close').on('click', function(event) {
      event.preventDefault();
      $('.modal').each(function() {
        $(this).modal('hide');
      });
      $('.modal-backdrop').remove();
      reset_reload_data();
    });

    event_click_invoice_column();
    event_enter_invoice_search();
  });
  dropMenuStatus();
  prepare_invoice_variable();
  event_click_menu_main();
});

function prepare_invoice_variable(){
  $current_invoice_status = 'init';
  $list_invoice_page = 1;
  $on_load_invoice = false;
  $invoice_searched_query = '';
}

function on_load_more_invoice() {
  $('.load-more-invoice').scroll(function () {
    if ($(this)[0].scrollHeight - $(this).scrollTop() <  $(this).outerHeight() + 5) {
      if(!$on_load_invoice && ($list_invoice_page + 1) <= $max_page_list) {
        show_loading_after();
        $list_invoice_page = $list_invoice_page + 1;
        $on_load_invoice = true;
        $('#invoice_search_query').val($invoice_searched_query);
        $('#add_more_page_invoice').html('<input hidden name="page" value="' + $list_invoice_page + '" />');
        $('#add_more_loadmore_invoice').html('<input hidden name="load_more" value=1 />');
        $('#form-search-invoice').submit();
      }
    }
  });
}

function dropMenuStatus() {
  $(document).on('click', '.nht-item-invoices-status', function() {
    str = '<b>' + $(this)[0].innerText +'</b>';
    str += '<b class="caret"></b>';
    $('.nht-dropdown-toggle-invoices-status').html(str);
    str = $(this)[0].innerText + ' invoices';
    str = str.toUpperCase();
    $('.nht-invoices-title').html(str);
    $('.nht-dropdown-menu-invoices-status').slideUp(200);
    reset_invoice_search();
    $current_invoice_status = $(this).attr('data');
    $('#add_more_status_invoice').html('<input name="status" value="' + $current_invoice_status + '" />');
    link = '/shop/invoices/status/' + $current_invoice_status;
    $('#area_hidden').html('<a data-remote="true" href="' + link + '"></a>');
    $('#form-search-invoice').submit();
  });

  $(document).on('click', '.nht-dropdown-toggle-invoices-status', function() {
    $('.nht-dropdown-menu-invoices-status').slideDown(200);
  });
}

function event_click_invoice_column(){
  $('.i-column-info').click(function(){
    event.preventDefault();
    show_loading_after();
    $list_invoice_page = 1;
    $('#add_more_page_invoice').html('');
    $('#add_more_loadmore_invoice').html('');
    if(this != $current_column){
      reset_invoice_sort_column();
      $current_column = this;
    }
    form = $('#form-search-invoice');
    data = change_data_filter_column($(this).attr('data'), $(this).find('span'), this);
    $(this).attr('data', data);
    $('#add_more_column_invoice').html('<input hidden name="search[column]" value="' + data + '" />');
    $(form).submit();
  });
}

function change_data_filter_column(data, icon, object){
  if(data.search('desc') != -1) {
    $(icon).attr('class', 'glyphicon glyphicon-arrow-up');
    return data.replace('desc', 'asc');
  }
  else if(data.search('asc') != -1) {
    $(icon).attr('class', 'glyphicon glyphicon-arrow-down');
    return data.replace('asc', 'desc');
  }
  else {
    $(object).append('<span class="lvc-arrow glyphicon glyphicon-arrow-down"></span>');
    return data + ' desc';
  }
}

function reset_invoice_sort_column(){
  $('.i-column-info').each(function(){
    $(this).find('span').remove();
    data = $(this).attr('data');
    if(data)
      $(this).attr('data', data.replace('asc', '').replace('desc', ''));
  });
}

function event_enter_invoice_search(){
  $('#search_invoice_query').keydown(function(e){
    if(e.which == 13) {
      e.preventDefault();
      reset_invoice_search();
      reset_invoice_sort_column();
      $invoice_searched_query = $('#search_invoice_query').val();
      $('#add_more_status_invoice').html('<input name="status" value="' + $current_invoice_status + '" />');
      $(this).parent().submit();
    }
  });
}

function reset_invoice_search(){
  $list_invoice_page = 1;
  $('#add_more_loadmore_invoice').html('');
  $('#add_more_column_invoice').html('');
  $('#add_more_status_invoice').html('');
  $('#add_more_page_invoice').html('');
}
