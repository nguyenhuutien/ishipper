document.addEventListener("turbolinks:load", function() {
  stackModal = [];
  $('.modal').on('shown.bs.modal', function () {
    if(stackModal.length == 0) {
      $('.back').remove();
    }

    stackModal.push($(this).attr('id'));

    $('.btn-back').on('click', function() {
      stackModal.pop();
      $('#' + stackModal[stackModal.length - 1]).modal('show');
    });

    $('.close').on('click', function() {
      stackModal = [];
    });
  });
});
