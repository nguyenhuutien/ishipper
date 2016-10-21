document.addEventListener("turbolinks:load", function() {
  $('.page-scroll').click(function() {
    var position_div = $(this).attr('href');
    if(position_div == '#home'){
      $('html, body').stop().animate({scrollTop: 0}, 1000);
    } else {
      var position_top = $(position_div).position().top;
      $('html, body').stop().animate({scrollTop: position_top}, 1000);
    }
    $('.page-scroll').parent().removeClass('active');
    $(this).parent().addClass('active');
    return false;
  });

  var previousScroll = 0;
  var dis_top = 200;
  $(window).on('scroll', function(){
    var scroll_top = $(window).scrollTop();
    var about_top = $('#about').position().top;
    var contact_top = $('#contact').position().top;
    if (scroll_top < about_top - dis_top) {
      $('.page-scroll').parent().removeClass('active');
      $('#_home').addClass('active');
    }
    else if (contact_top - dis_top > scroll_top && scroll_top > about_top - dis_top) {
      $('.page-scroll').parent().removeClass('active');
      $('#_about').addClass('active');
    }
    else if (scroll_top > contact_top - dis_top) {
      $('.page-scroll').parent().removeClass('active');
      $('#_contact').addClass('active');
    }
  });
});
