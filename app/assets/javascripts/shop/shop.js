document.addEventListener("turbolinks:load", function() {
  $('.modal').on('shown.bs.modal', function () {
    $('#nht-sign_up .modal-content').niceScroll({
      cursorwidth: "6px",
      cursorcolor: "rgba(0, 0, 0, 0.4)",
      railpadding: { top: 0},
    });
  });
});
