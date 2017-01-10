document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    $('.div-table-content').niceScroll({
      cursorwidth: "6px",
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

    dropMenuStatus();
    event_click_invoice_column();
    event_typed_enter_search();
  });
  event_click_menu_status();
});

$list_invoice_page = 1;
$on_load_invoice = false;
function on_load_more_invoice() {
  $('.load-more-invoice').scroll(function () {
    if ($(this)[0].scrollHeight - $(this).scrollTop() <  $(this).outerHeight() + 5) {
      if(!$on_load_invoice) {
        $on_load_invoice = true;
        $list_invoice_page = $list_invoice_page + 1;
        add_load_more_invoice($url_current_list + '?load_more=1&page=' + $list_invoice_page);
        $('#load-more-invoice').children().trigger('click').remove();
      }
    }
  });
}

function add_load_more_invoice(link){
  $('#load-more-invoice').append('<a data-remote="true" href="' + link +'"></a>');
}

function event_click_menu_status() {
  $(document).on('click', '.node-dropdown-status', function(){
    $url_current_list = $(this).attr('href');
    $list_invoice_page = 1;
  })
}

function dropMenuStatus() {
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
}

function event_click_invoice_column(){
  $('.i-column-info').click(function(){
    event.preventDefault();
    show_loading_after();
    if(this != $current_column){
      reset_invoice_sort_column();
      $current_column = this;
    }
    form = $('#form-search-invoice');
    data = change_data_filter_column($(this).attr('data'), $(this).find('span'), this);
    $(this).attr('data', data);
    $('#add_more_search_invoice').html('<input hidden name="search[column]" value="' + data + '" />');
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
  $('.lvc-arrow').remove();
  $('.i-column-info').each(function(){
    $(this).find('span').remove();
    data = $(this).attr('data');
    if(data)
      $(this).attr('data', data.replace('asc', '').replace('desc', ''));
  });
}

function event_typed_enter_search(){
  $('#search_query').keypress(function(e){
    if(e.which == 13) {
      reset_invoice_sort_column();
      $(this).parent().submit();
    }
  });
}
