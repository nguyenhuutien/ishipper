document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    showInvoicesDetail();
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

function showInvoicesDetail() {
  $('.nht-invoices-show').mouseenter(function() {
    $('.nht-invoices-show-extend.' + this.id).show();
    $('.nht-invoices-show-extend.' + this.id).addClass('border-invoices-detail');
    $(this).mouseout(function() {
      $('.nht-invoices-show-extend.' + this.id).removeClass('border-invoices-detail');
      $('.nht-invoices-show-extend.' + this.id).hide();
    });
  });
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
