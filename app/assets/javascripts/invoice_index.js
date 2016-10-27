document.addEventListener("turbolinks:load", function() {
  var openInbox = document.getElementById("myBtn");
  openInbox.click();

  function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
  }
  function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
  }

  function myFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
      x.className += " w3-show";
      x.previousElementSibling.className += " w3-red";
    } else {
      x.className = x.className.replace(" w3-show", "");
      x.previousElementSibling.className =
      x.previousElementSibling.className.replace(" w3-red", "");
    }
  }

  openMail("all")
  function openMail(statusName) {
    var i;
    var x = document.getElementsByClassName("status");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    x = document.getElementsByClassName("test");
    for (i = 0; i < x.length; i++) {
      x[i].className = x[i].className.replace(" w3-light-grey", "");
    }
    document.getElementById(statusName).style.display = "block";
    event.currentTarget.className += " w3-light-grey";
  };

  $('#myBtn').on('click', function(){
    myFunc('Demo1');
  });

  $('.test').on('click', function(){
    var check = $(this).data('check');
    openMail(check);
    w3_close();
  });

  $('.close_side_menu').on('click', function(){
    w3_close();
  });

  $('.td-menu-hide').on('click', function(){
    w3_open();
  });
});
