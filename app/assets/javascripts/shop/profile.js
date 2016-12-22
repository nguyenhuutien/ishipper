document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#avatar_upload').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }

    $('.file').change(function(){
      readURL(this);
    });
  });
});
