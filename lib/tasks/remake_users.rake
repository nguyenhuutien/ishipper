namespace :db do
  desc "Import user"
  task users: [:environment] do
    user1 = User.create!(
      name: "Shop 91",
      phone_number: "+841234567891",
      password: "12345678",
      password_confirmation: "12345678",
      email: "shop91@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 3.5)
    user1.user_tokens.create! authentication_token: "+841234567891"
    latitude = Faker::Number.between(0, 25000)
    latitude = 21 + latitude/1000000.0
    longitude = Faker::Number.between(825000, 865000)
    longitude = 105 + longitude/1000000.0
    user1.create_user_setting unread_notification: 0,
      latitude: latitude,
      longitude: longitude,
      role: "ShopSetting"

    user2 = User.create!(
      name: "Shop 92",
      phone_number: "+841234567892",
      password: "12345678",
      password_confirmation: "12345678",
      email: "shop92@framgia.com",
      role: "Shop",
      status: "actived",
      rate: 2.5)
    user2.user_tokens.create! authentication_token: "+841234567892"
    latitude = Faker::Number.between(0, 25000)
    latitude = 21 + latitude/1000000.0
    longitude = Faker::Number.between(825000, 865000)
    longitude = 105 + longitude/1000000.0
    user2.create_user_setting unread_notification: 0,
      latitude: latitude,
      longitude: longitude,
      role: "ShopSetting"

    user3 = User.create!(
      name: "Shipper 97",
      phone_number: "+841234567897",
      password: "12345678",
      password_confirmation: "12345678",
      email: "shipper97@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 2.5)
    user3.user_tokens.create! authentication_token: "+841234567897"
    latitude = Faker::Number.between(0, 25000)
    latitude = 21 + latitude/1000000.0
    longitude = Faker::Number.between(825000, 865000)
    longitude = 105 + longitude/1000000.0
    user3.create_user_setting unread_notification: 0,
      latitude: latitude,
      longitude: longitude,
      role: "ShipperSetting"

    user4 = User.create!(
      name: "Shipper 98",
      phone_number: "+841234567898",
      password: "12345678",
      password_confirmation: "12345678",
      email: "shipper98@framgia.com",
      role: "Shipper",
      status: "actived",
      rate: 2.5)
    user4.user_tokens.create! authentication_token: "+841234567898"
    latitude = Faker::Number.between(0, 25000)
    latitude = 21 + latitude/1000000.0
    longitude = Faker::Number.between(825000, 865000)
    longitude = 105 + longitude/1000000.0
    user4.create_user_setting unread_notification: 0,
      latitude: latitude,
      longitude: longitude,
      role: "ShipperSetting"

    number = 1234567860
    (1..20).each do |n|
      phone_number = number + n
      shipper = User.create! name: "Shipper #{n}",
        phone_number: "+84" + phone_number.to_s,
        password: "12345678",
        password_confirmation: "12345678",
        email: "shipper#{n}@framgia.com",
        role: "Shipper",
        status: "actived",
        rate: 3.5
      shipper.user_tokens.create! authentication_token: "+84" + phone_number.to_s
      latitude = Faker::Number.between(0, 25000)
      latitude = 21 + latitude/1000000.0
      longitude = Faker::Number.between(825000, 865000)
      longitude = 105 + longitude/1000000.0
      shipper.create_user_setting unread_notification: 0,
        latitude: latitude,
        longitude: longitude,
        role: "ShipperSetting"
    end

    number = 1234567800
    (1..20).each do |n|
      phone_number = number + n
      shop = User.create! name: "Shop #{n}",
        phone_number: "+84" + phone_number.to_s,
        password: "12345678",
        password_confirmation: "12345678",
        email: "shop#{n}@framgia.com",
        role: "Shop",
        status: "actived",
        rate: 3.5
      shop.user_tokens.create! authentication_token: "+84" + phone_number.to_s
      latitude = Faker::Number.between(0, 25000)
      latitude = 21 + latitude/1000000.0
      longitude = Faker::Number.between(825000, 865000)
      longitude = 105 + longitude/1000000.0
      shop.create_user_setting unread_notification: 0,
        latitude: latitude,
        longitude: longitude,
        role: "ShopSetting"
    end

    user14 = User.create!(
      name: "Admin",
      phone_number: "+841234567890",
      password: "12345678",
      password_confirmation: "12345678",
      email: "Admin@framgia.com",
      role: "Admin",
      status: "actived",
      rate: 2.5)
    user14.user_tokens.create! authentication_token: "+841234567890"
    user14.create_user_setting unread_notification: 0,
      latitude: 21.0092948,
      longitude: 105.8099247,
      role: "AdminSetting"
  end
end
