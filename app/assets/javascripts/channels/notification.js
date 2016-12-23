var owners = [];
var invoices = [];
var notifications = [];

if (getCookie("user_token_id")) {
  var channel = "NotificationChannel";
  App.notification = App.cable.subscriptions.create({
    channel: channel}, {
    received: function(data) {
      if (data.owner !== undefined) {
        owner = data.owner;
        invoice = data.invoice;
        notification = data.notification;

        owners.push(owner);
        invoices.push(invoice);
        notifications.push(notification);

      }
    },

    speak: function(data) {
      this.perform('speak', data);
    }
  });
}

function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

function convertNotification(owner, invoice, notification) {
  message = '<strong>' + owner.name + ' </strong>' + notification.status + ' <strong>' + invoice.name + '</strong>';
  html = '<li class="nht-notification notification-' + notification.id + ' false-notification">';
  html += '<span class="col-md-2 col-lg-2 nht-notification-avatar">';
  html += '<img src="" id="avatar-' + notification.id + '" class="img-responsive nht-avatar">';
  html += '<div class="clearfix"></div></span>';
  html += '<span class="col-md-10 col-lg-10 nht-notification-content">';
  html += message + '<div class="small">' + jQuery.timeago(notification.created_at) + '</div></span>';
  html += '<div class="clearfix"></div></li><div class="clearfix"></div>';
  return html;
}

document.addEventListener("turbolinks:load", function() {
  if ($('.nht-notification-count').is(':visible')) {
    if($('.nht-notification-count')[0].innerText == '0') {
      $('.nht-notification-count').hide();
    } else {
      $('.nht-notifications').show();
    }
  }

  if($('.nht-notifications').length) {
    $('.nht-notifications').hide();
  }

  $('.nht-notification-icon').on('click', function() {
    $('.nht-notification-icon i').toggleClass('fa-globe-focus');
  });

  $('.nht-notification-icon').on('click', function() {
    $('.dropdown-menu').slideUp(200);

    if (!$('.nht-notifications').is(":visible")) {
      $('.nht-notification-count').hide();
      $('.nht-noti-list').niceScroll({
        cursorwidth: "6px",
        cursorcolor: "rgba(0, 0, 0, 0.4)",
        autohidemode: false,
        cursorminheight: 100,
      });
      App.notification.speak({action_type: "unread_notification"});

      $.each( notifications, function(index, value) {
        owner = owners[index];
        invoice = invoices[index];
        notification = notifications[index];
        html = convertNotification(owner, invoice, notification);
        $('.nht-noti-list').prepend(html);
        if (owner.avatar.url != null) {
          $('#avatar-' + notification.id)[0].src = owner.avatar.url;
        } else {
          $('#avatar-' + notification.id)[0].src = '../assets/images/profile.jpg';
        }
        $('.notification-' + notification.id).on('click', function() {
          window.location.assign(window.location.origin + '/shop/invoices/' + invoice.id);
        });
      });
      owners = [];
      invoices = [];
      notifications = [];
      setTimeout(function(){
        $('.nht-up-arrow').addClass('block');
      }, 200);
      $('.nht-notifications').slideDown(400);
    } else {
      $('.nht-up-arrow').removeClass('block');
      $('.nht-notifications').slideUp(400);
    }

  });

  $('.nht-notification').on('click', function() {
    id = parseInt(this.className.split(' ')[1].split('-')[1]);
    App.notification.speak({action_type: "unread_notification", notification_id: id});
  });

  $('.false-notification').on('mouseover', function() {
    $(this).addClass('true-notification');
  });

  $('.false-notification').on('mouseout', function() {
    $(this).removeClass('true-notification');
  });
});
