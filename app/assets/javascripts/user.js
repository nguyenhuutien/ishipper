document.addEventListener("turbolinks:load", function() {
  $('#search-user').on('input',function(e){
    var input, filter, ul, li, a, i;
    input = document.getElementById('search-user');
    filter = input.value.toUpperCase();
    ul = document.getElementById("favorite-users");
    li = ul.getElementsByTagName('li');

    for (i = 0; i < li.length; i++) {
      a = li[i].getElementsByTagName("a")[0];
      if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
        li[i].style.display = '';
      } else {
        li[i].style.display = 'none';
      }
    }
  });

  $('#search-user').on('input',function(e){
    var input, filter, ul, li, a, i;
    input = document.getElementById('search-user');
    filter = input.value.toUpperCase();
    ul = document.getElementById("black-users");
    li = ul.getElementsByTagName('li');

    for (i = 0; i < li.length; i++) {
      a = li[i].getElementsByTagName("a")[0];
      if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
        li[i].style.display = '';
      } else {
        li[i].style.display = 'none';
      }
    }
  });

  var rate_five = $('.five .bar').data('id');
  var rate_four = $('.four .bar').data('id');
  var rate_three = $('.three .bar').data('id');
  var rate_two = $('.two .bar').data('id');
  var rate_one = $('.one .bar').data('id');
  var sum = rate_five + rate_four + rate_three + rate_two + rate_two;
  if (sum == 0) {
    $('.five .bar').width(0);
    $('.four .bar').width(0);
    $('.three .bar').width(0);
    $('.two .bar').width(0);
    $('.one .bar').width(0);
  } else {
    $('.five .bar').css("width", (rate_five / sum)*80 + '%');
    $('.four .bar').css("width", (rate_four / sum)*80 + '%');
    $('.three .bar').css("width", (rate_three / sum)*80 + '%');
    $('.two .bar').css("width", (rate_two / sum)*80 + '%');
    $('.one .bar').css("width", (rate_one / sum)*80 + '%');
  }

  $("#current_location").keyup(function(){
    var address = $("#current_location").val();
    $("#current_location").val(address);
  });
});
