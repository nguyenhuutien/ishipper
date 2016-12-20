namespace :db do
  desc "Import user_invoices"
  task user_invoices: [:environment] do
    (4..6).each do |n|
      (1..200).each do |m|
        user_id = n
        invoice_id = m

        invoice = Invoice.find_by_id invoice_id
        user_invoice = invoice.user_invoices.create! user_id: user_id, status: "init"
        user_invoice.user_invoice_histories.create! status: "init", creater_id: user_id
        Notification.create! owner_id: user_id, recipient_id: invoice.user.id, status: "receive",
          invoice_id: invoice.id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.LIST_SHIPPER_REGISTER"
      end
    end

    (1..50).each do |m|
      user_id = 3
      invoice_id = m

      invoice = Invoice.find_by_id invoice_id
      user_invoice = invoice.user_invoices.create! user_id: user_id, status: "init"
      user_invoice.user_invoice_histories.create! status: "init", creater_id: user_id
      Notification.create! owner_id: user_id, recipient_id: invoice.user.id, status: "receive",
        invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.LIST_SHIPPER_REGISTER"
    end
  end
end
