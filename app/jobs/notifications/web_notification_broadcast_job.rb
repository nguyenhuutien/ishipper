class Notifications::WebNotificationBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform args
    ActionCable.server.broadcast args[:channel], {owner: args[:owner],
      invoice: args[:invoice], notification: args[:notification]}
  end
end
