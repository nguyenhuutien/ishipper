class ShipperServices::RealtimeVisibilityShipperService
  attr_reader :args

  def initialize args
    @recipients = args[:recipients]
    @shipper = args[:shipper]
    @action = args[:action]
  end

  def perform
    @recipients.each do |recipient|
      channel = "#{recipient.phone_number}_realtime_channel"
      data = Hash.new
      data[:user] = @shipper
      RealtimeBroadcastJob.perform_now channel: channel, action: @action, data: data
    end
  end
end
