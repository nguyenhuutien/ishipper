class RealtimeChannel < ApplicationCable::Channel
  def subscribed
    channel_name = "#{self.current_user.user.phone_number}_realtime_channel"
    stream_from channel_name
    data = Hash.new
    data[:unread_notification] = self.current_user.user.user_setting.unread_notification
    RealtimeBroadcastJob.perform_now channel: channel_name,
      action: Settings.realtime.unread_notification, data: data
  end

  def unsubscribed
    if UserToken.find_by_id self.current_user.id
      self.current_user.update_attribute "online", false
      if self.current_user.user.shipper?
        serializer = ActiveModelSerializers::SerializableResource.
          new(self.current_user.user).as_json
        near_shops = User.near([self.current_user.user.latitude, self.current_user.user.longitude],
          Settings.max_distance).shop.users_online
        realtime_visibility_shipper = ShipperServices::RealtimeVisibilityShipperService.new recipients: near_shops,
          shipper: serializer, action: Settings.realtime.shipper_offline
        realtime_visibility_shipper.perform
      end
    end
  end
end
