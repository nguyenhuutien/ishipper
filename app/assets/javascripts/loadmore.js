document.addEventListener("turbolinks:load", function() {
  size_reviews = $(".td-user-review").size();
  x=3;
  $('.td-user-review:lt('+x+')').show();
  $('#loadMore').click(function () {
    x= (x+3 <= size_reviews) ? x+3 : size_reviews;
    $('.td-user-review:lt('+x+')').show();
  });
  $('#showLess').click(function () {
    x=(x-3<0) ? 3 : x-3;
    $('.td-user-review').not(':lt('+x+')').hide();
  });
});
