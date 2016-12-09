namespace :db do
  desc "Import user"
  task users: [:environment] do
    user1 = User.create!(
      name: "Shop 1",
      phone_number: "+841694949947",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.dinh.duc.Shop@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 3.5)
    user1.user_tokens.create! authentication_token: Devise.friendly_token
    user1.create_user_setting unread_notification: 0,
      latitude: 21.0066625,
      longitude: 105.8157497

    user2 = User.create!(
      name: "Shop 2",
      phone_number: "+84976990043",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.thanh.hung.Shop@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 2.5)
    user2.user_tokens.create! authentication_token: Devise.friendly_token
    user2.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user3 = User.create!(
      name: "Shop 3",
      phone_number: "+84984063061",
      password: "12345678",
      password_confirmation: "12345678",
      email: "vu.duy.chuong.Shop@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 1.5)
    user3.user_tokens.create! authentication_token: Devise.friendly_token
    user3.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user4 = User.create!(
      name: "Shipper 1",
      phone_number: "+841694949948",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.dinh.duc.Shipper@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 3.5)
    user4.user_tokens.create! authentication_token: Devise.friendly_token
    user4.create_user_setting unread_notification: 0,
      latitude: 21.0066625,
      longitude: 105.8157497

    user5 = User.create!(
      name: "Shipper 2",
      phone_number: "+84976990044",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.thanh.hung.Shipper@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 2.5)
    user5.user_tokens.create! authentication_token: Devise.friendly_token
    user5.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user6 = User.create!(
      name: "Shipper 3",
      phone_number: "+84984063062",
      password: "12345678",
      password_confirmation: "12345678",
      email: "vu.duy.chuong.Shipper@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 1.5)
    user6.user_tokens.create! authentication_token: Devise.friendly_token
    user6.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user8 = User.create!(
      name: "Nguyen Huu Tien",
      phone_number: "+841648295795",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.huu.tien@framgia.com",
      role: "Shipper",
      status: "unactive",
      rate: 0)
    user8.user_tokens.create! authentication_token: Devise.friendly_token
    user8.create_user_setting unread_notification: 0,
      latitude: 21.0093557,
      longitude: 105.8554427

    user9 = User.create!(
      name: "Dao Manh Nhat",
      phone_number: "+84977656089",
      password: "12345678",
      password_confirmation: "12345678",
      email: "dao.manh.nhat@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 4.5)
    user9.user_tokens.create! authentication_token: Devise.friendly_token
    user9.create_user_setting unread_notification: 0,
      latitude: 21.0072829,
      longitude: 105.8413891

    user10 = User.create!(
      name: "Ta Tat Dat",
      phone_number: "+841674391369",
      password: "12345678",
      password_confirmation: "12345678",
      email: "ta.tat.dat@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 4)
    user10.user_tokens.create! authentication_token: Devise.friendly_token
    user10.create_user_setting unread_notification: 0,
      latitude: 21.0061393,
      longitude: 105.8419748

    user11 = User.create!(
      name: "Mau Ha Quang",
      phone_number: "+84905068885",
      password: "12345678",
      password_confirmation: "12345678",
      email: "mau.ha.quang@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 3)
    user11.user_tokens.create! authentication_token: Devise.friendly_token
    user11.create_user_setting unread_notification: 0,
      latitude: 21.0144139,
      longitude: 105.8031754

    user12 = User.create!(
      name: "Shop",
      phone_number: "+841234567891",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguyen.van.a@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 5)
    user12.user_tokens.create! authentication_token: Devise.friendly_token
    user12.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user13 = User.create!(
      name: "Shipper",
      phone_number: "+841234567892",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguye.van.b@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 1.5)
    user13.user_tokens.create! authentication_token: Devise.friendly_token
    user13.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user14 = User.create!(
      name: "Admin",
      phone_number: "+841234567890",
      password: "12345678",
      password_confirmation: "12345678",
      email: "Admin@framgia.com",
      role: "Admin",
      status: "actived",
      rate: 2.5)
    user14.user_tokens.create! authentication_token: Devise.friendly_token
    user14.create_user_setting unread_notification: 0,
      latitude: 21.0092948,
      longitude: 105.8099247

    user15 = User.create!(
      name: "Shipper98",
      phone_number: "+841234567898",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguye.van.c@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 1.5)
    user15.user_tokens.create! authentication_token: Devise.friendly_token
    user15.create_user_setting unread_notification: 0,
      latitude: 21.0167188,
      longitude: 105.7819804

    user16 = User.create!(
      name: "Shipper97",
      phone_number: "+841234567897",
      password: "12345678",
      password_confirmation: "12345678",
      email: "nguye.van.d@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 1.5)
    user16.user_tokens.create! authentication_token: Devise.friendly_token
    user16.create_user_setting unread_notification: 0,
      latitude: 21.0167198,
      longitude: 105.7819814
  end
end
