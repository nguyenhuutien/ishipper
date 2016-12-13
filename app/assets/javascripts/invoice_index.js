document.addEventListener('turbolinks:load', function() {

  function w3_open() {
    document.getElementById('mySidenav').style.display = 'block';
    document.getElementById('myOverlay').style.display = 'block';
  };

  function w3_close() {
    document.getElementById('mySidenav').style.display = 'none';
    document.getElementById('myOverlay').style.display = 'none';
  };

  function myFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf('w3-show') == -1) {
      x.className += ' w3-show';
      x.previousElementSibling.className += 'td-fix-w3';
    } else {
      x.className = x.className.replace(' w3-show', '');
      x.previousElementSibling.className =
      x.previousElementSibling.className.replace('td-fix-w3', '');
    }
  };

  function openMail(statusName) {
    var i;
    var x = document.getElementsByClassName('status');
    for (i = 0; i < x.length; i++) {
      x[i].style.display = 'none';
    }
    x = document.getElementsByClassName('list-category');
    for (i = 0; i < x.length; i++) {
      x[i].className = x[i].className.replace(' td-green', '');
    }
    document.getElementById(statusName).style.display = 'block';
  };

  $('#myBtn').on('click', function(){
    myFunc('Demo1');
  });

  $('.list-category').on('click', function(){
    var check = $(this).data('check');
    openMail(check);
    w3_close();
    $('.list-category').removeClass('td-green');
    $(this).addClass('td-green');
  });

  $('.close_side_menu').on('click', function(){
    w3_close();
  });

  $('.td-menu-hide').on('click', function(){
    w3_open();
  });

  var openInbox = document.getElementById('myBtn');
  if ($('#mySidenav').length > 0) {
    openInbox.click();
  }
});
