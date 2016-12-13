document.addEventListener("turbolinks:load", function() {
  size_reviews = $(".td-user-review").size();
  x=3;
  $('.td-user-review:lt('+x+')').show();
  if(size_reviews <= 3) {
    $('#loadMore').hide();
    $('#showLess').hide();
  }
  else {
    $('#loadMore').show();
    $('#loadMore').click(function () {
      x= (x+3 <= size_reviews) ? x+3 : size_reviews;
      $('.td-user-review:lt('+x+')').show();
      if(x >= size_reviews) {
        $('#loadMore').hide();
      }
      else {
        $('#loadMore').show();
      }
    });
    $('#showLess').click(function () {
      x=(x-3<0) ? 3 : x-3;
      $('.td-user-review').not(':lt('+x+')').hide();
      $('#loadMore').show();
    });
  }
});
