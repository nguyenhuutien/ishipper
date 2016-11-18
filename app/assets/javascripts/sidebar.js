document.addEventListener("turbolinks:load", function() {
  if ($('.all').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.all-sidebar').addClass('sidebar-active');
  } else if($('.init').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.init-sidebar').addClass('sidebar-active');
  } else if($('.waiting').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.waiting-sidebar').addClass('sidebar-active');
  } else if($('.shipping').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.shipping-sidebar').addClass('sidebar-active');
  } else if($('.shipped').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.shipped-sidebar').addClass('sidebar-active');
  } else if($('.finished').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.finished-sidebar').addClass('sidebar-active');
  } else if($('.cancel').length) {
    $('#Demo1 div').removeClass('sidebar-active');
    $('.cancel-sidebar').addClass('sidebar-active');
  }

});
