namespace :db do
  desc "Import invoices"
  task invoices2: [:environment] do
    invoices = []
    invoice_histories = []
    status_invoice_histories = []
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

      invoices << Invoice.new(name: "Don hang so #{n}",
        address_start: address_start,
        latitude_start: latitude_start, longitude_start: longitude_start,
        address_finish: address_finish,
        latitude_finish: latitude_finish, longitude_finish: longitude_finish,
        status: "init", user_id: user_id, weight: weight, delivery_time: "30m",
        distance_invoice: distance_invoice, price: price, shipping_price: shipping_price,
        customer_name: customer_name, customer_number: "+84123456789")

    end
    Invoice.import invoices

    load_invoices = Invoice.all
    load_invoices.each do |invoice|
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "init", invoice_id: invoice.id)
    end
    InvoiceHistory.import invoice_histories
    StatusInvoiceHistory.import status_invoice_histories
  end
end
