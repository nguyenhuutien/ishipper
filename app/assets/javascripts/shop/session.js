document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    correctPhoneNumber();
  });
  correctPhoneNumber();
});

function correctPhoneNumber() {
  $('.new_user').submit(function(event) {
    country_code = $('#country_code option:selected').text();
    phone_number = $('#user_phone_number').val();
    phone_number = country_code + phone_number;
    $('#user_phone_number').val(phone_number);
  });
}

function reversePhoneNumber() {
  country_code = $('#country_code option:selected').text();
  phone_number = $('#user_phone_number').val();
  phone_number = phone_number.replace(country_code, "");
  $('#user_phone_number').val(phone_number);
}
