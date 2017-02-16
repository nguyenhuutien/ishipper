document.addEventListener('turbolinks:load', function() {
  $('.modal').on('shown.bs.modal', function () {
    correctPhoneNumber();
  });
  correctPhoneNumber();
});

function correctPhoneNumber() {
  $('.new_user').submit(function(event) {
    country_code = $('#country_code option:selected').text();
    phone_number = $('#unphone_number').val();

    if (phone_number.indexOf('0') == 0) {
      phone_number = phone_number.substr(1, phone_number.length - 1);
      phone_number = country_code + phone_number;
    } else if (phone_number.indexOf(country_code) == -1) {
      phone_number = country_code + phone_number;
    }
    $('#user_phone_number').val(phone_number);
  });
}
