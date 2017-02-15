document.addEventListener("turbolinks:load", function initializeMap() {
  $('form').on('click', '.remove_fields', function(){
    $(this).closest('.field').remove();
    event.preventDefault();
  });

  $('form').on('click', '.add_fields', function(){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });

  $('.hs-search').click(function(){
    status = $(this).attr('status');
    data = JSON.parse($(this).attr('data'));
    if(status == 'hide'){
      $(this).attr('status', 'show');
      $(this).html(data.hide);
      $(this).next().show();
    } else {
      $(this).attr('status', 'hide');
      $(this).html(data.show);
      $(this).next().hide();
    }
  });
});
