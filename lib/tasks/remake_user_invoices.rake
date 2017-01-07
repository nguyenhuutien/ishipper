namespace :db do
  desc "Import user_invoices"
  task user_invoices: [:environment] do

    user_invoices = []
    load_invoices1 = Invoice.where id: 1..15
    load_invoices2 = Invoice.where id: 16..200
    load_invoices1.each do |invoice|
      (3..6).each do |n|
        user_id = n
        user_invoices << UserInvoice.new(user_id: user_id, status: "init", invoice_id: invoice.id)
      end
    end
    load_invoices2.each do |invoice|
      (4..6).each do |n|
        user_id = n
        user_invoices << UserInvoice.new(user_id: user_id, status: "init", invoice_id: invoice.id)
      end
    end
    UserInvoice.import user_invoices

    user_invoice_histories = []
    notifications = []
    load_user_invoices = UserInvoice.all
    load_user_invoices.each do |user_invoice|
      user_invoice_histories << UserInvoiceHistory.new(status: "init",
        creater_id: user_invoice.user_id, user_invoice_id: user_invoice.id)
      notifications << Notification.new(owner_id: user_invoice.user_id,
        recipient_id: user_invoice.invoice.user_id, status: "receive",
        invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.LIST_SHIPPER_REGISTER")
    end
    UserInvoiceHistory.import user_invoice_histories
    Notification.import notifications
  end
end
