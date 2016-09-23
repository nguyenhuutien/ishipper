require_relative "boot"

require "rails/all"
require "socket"
require "json"

Bundler.require(*Rails.groups)

module IShipper
  @@clients = Hash.new

  def send_notification client, notification
    data = notification.to_json.to_s
    client.puts data
  end

  class Application < Rails::Application
    include IShipper

    config.after_initialize do
      server = TCPServer.new 1234
      notification = Notification.new owner_id: 1, recipient_id: 1, key: "Test"
      while true
        Thread.start(server.accept) do |client|
          @@clients[notification.owner_id] = client

          while client && !client.closed?
            s = client.gets
            if s && s[0,16] == "get_notification"
              send_notification client, notification
            end
          end

          @@clients.delete notification.owner_id
          client.close
        end
      end
    end
  end
end
