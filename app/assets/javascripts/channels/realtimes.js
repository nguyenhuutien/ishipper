if (getCookie("user_id")) {
  var channel = "RealtimeChannel";
  App.cable.subscriptions.create({
    channel: channel
  });
}

function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}
