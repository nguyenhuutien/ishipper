document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('#nht-sign_up .modal-content').niceScroll({
      cursorwidth: "6px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: {top: 0},
    });

    $('.file').change(function(){
      readURL(this);
    });

    $('form.form-edit-profile').bind('ajax:complete', function(e, data, status, error) {
      close_loading_after();
      if (status == 'parsererror') {
        $('#hatd-update-profile-error').html(data.responseText);
      }
    });

    $('form.form-edit-password').bind('ajax:complete', function(e, data, status, error) {
      close_loading_after();
      if (status == 'parsererror') {
        $('#hatd-update-password-error').html(data.responseText);
      }
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
