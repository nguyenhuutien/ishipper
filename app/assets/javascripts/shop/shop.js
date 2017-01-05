document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('#nht-sign_up .modal-content').niceScroll({
      cursorwidth: "6px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: { top: 0},
    });

    $('.file').change(function(){
      readURL(this);
    });
  });
});

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#avatar_upload').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}
