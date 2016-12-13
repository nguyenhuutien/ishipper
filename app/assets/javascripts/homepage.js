document.addEventListener("turbolinks:load", function() {
  var flash = function(){
    setTimeout(function(){
      $('#flash').slideUp(2000);
    }, 1500);
  };
  $(document).ready(flash);
  $(document).on('page:load', flash);
  $(document).on('page:change', flash);

  $(function typeloop(){
    $("#title-slide-letter").typed({
      strings: [I18n.t("home_page.we")],
      typeSpeed: 80,
      showCursor: false
    });
    setInterval(function(){
      $('#slide-letter').typed({
        strings: [I18n.t("home_page.make_it_awsome")],
        typeSpeed: 80,
        showCursor: false
      });
    }, 400);
  });

  $(window).scroll(function(){
    var scroll_top = $(window).scrollTop();
    if (scroll_top > 150) {
      $('.td-ishipper-benefit-col-left').addClass('animated bounceInLeft');
      $('.td-ishipper-benefit-col-right').addClass('animated bounceInRight');
    }
  });
});
