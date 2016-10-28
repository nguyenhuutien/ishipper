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
});
