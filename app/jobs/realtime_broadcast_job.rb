class RealtimeBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform args
    ActionCable.server.broadcast args[:channel], {action: args[:action], data: args[:data]}
  end
end
