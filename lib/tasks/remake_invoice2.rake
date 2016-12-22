namespace :db do
  desc "Import invoices"
  task invoices2: [:environment] do
    (1..200).each do |n|
      address_start = Faker::Address.street_address + Faker::Address.street_name
      latitude_start = Faker::Number.between 900000, 1055000
      latitude_start = 20 + latitude_start/1000000.0
      longitude_start = Faker::Number.between 725000, 965000
      longitude_start = 105 + longitude_start/1000000.0
      address_finish = Faker::Address.street_address + Faker::Address.street_name
      latitude_finish = Faker::Number.between 900000, 1055000
      latitude_finish = 20 + latitude_finish/1000000.0
      longitude_finish = Faker::Number.between 725000, 965000
      longitude_finish = 105 + longitude_finish/1000000.0
      weight = Faker::Number.between 1, 10
      distance_invoice = Faker::Number.between 1, 20
      price = Faker::Number.between 50, 200
      price = price * 1000
      shipping_price = Faker::Number.between 10, 30
      shipping_price = shipping_price * 1000
      customer_name = Faker::Name.name
      description = Faker::Lorem.sentence
      user_id = Faker::Number.between 1, 2

      invoice = Invoice.create! name: "Don hang so #{n}",
        address_start: address_start,
        latitude_start: latitude_start, longitude_start: longitude_start,
        address_finish: address_finish,
        latitude_finish: latitude_finish, longitude_finish: longitude_finish,
        status: "init", user_id: user_id, weight: weight, delivery_time: "30m",
        distance_invoice: distance_invoice, price: price, shipping_price: shipping_price,
        customer_name: customer_name, customer_number: "+84123456789"

      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => 1
      invoice.invoice_histories.create! invoice_params

      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "init"
    end
  end
end
