namespace :db do
  desc "Import user_invoices"
  task user_invoices: [:environment] do
    UserInvoice.create!(
      user_id: 10, invoice_id: 1, status: "init")
    UserInvoice.create!(
      user_id: 2, invoice_id: 2, status: "waiting")
    UserInvoice.create!(
      user_id: 3, invoice_id: 3, status: "shipping")
    UserInvoice.create!(
      user_id: 4, invoice_id: 4, status: "shipped")
    UserInvoice.create!(
      user_id: 5, invoice_id: 5, status: "finished")
    UserInvoice.create!(
      user_id: 6, invoice_id: 6, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 7, status: "init")
    UserInvoice.create!(
      user_id: 8, invoice_id: 8, status: "waiting")
    UserInvoice.create!(
      user_id: 9, invoice_id: 9, status: "shipping")
    UserInvoice.create!(
      user_id: 10, invoice_id: 10, status: "shipped")
    UserInvoice.create!(
      user_id: 10, invoice_id: 11, status: "finished")
    UserInvoice.create!(
      user_id: 2, invoice_id: 12, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 13, status: "init")
    UserInvoice.create!(
      user_id: 4, invoice_id: 14, status: "waiting")
    UserInvoice.create!(
      user_id: 5, invoice_id: 15, status: "shipping")
    UserInvoice.create!(
      user_id: 6, invoice_id: 16, status: "shipped")
    UserInvoice.create!(
      user_id: 7, invoice_id: 17, status: "finished")
    UserInvoice.create!(
      user_id: 8, invoice_id: 18, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 19, status: "init")
    UserInvoice.create!(
      user_id: 10, invoice_id: 20, status: "waiting")
    UserInvoice.create!(
      user_id: 10, invoice_id: 21, status: "shipping")
    UserInvoice.create!(
      user_id: 2, invoice_id: 22, status: "shipped")
    UserInvoice.create!(
      user_id: 3, invoice_id: 23, status: "finished")
    UserInvoice.create!(
      user_id: 4, invoice_id: 24, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 25, status: "init")
    UserInvoice.create!(
      user_id: 6, invoice_id: 26, status: "waiting")
    UserInvoice.create!(
      user_id: 7, invoice_id: 27, status: "shipping")
    UserInvoice.create!(
      user_id: 8, invoice_id: 28, status: "shipped")
    UserInvoice.create!(
      user_id: 9, invoice_id: 29, status: "finished")
    UserInvoice.create!(
      user_id: 10, invoice_id: 30, status: "cancel")
      UserInvoice.create!(
      user_id: 10, invoice_id: 31, status: "init")
    UserInvoice.create!(
      user_id: 2, invoice_id: 32, status: "waiting")
    UserInvoice.create!(
      user_id: 3, invoice_id: 33, status: "shipping")
    UserInvoice.create!(
      user_id: 4, invoice_id: 34, status: "shipped")
    UserInvoice.create!(
      user_id: 5, invoice_id: 35, status: "finished")
    UserInvoice.create!(
      user_id: 6, invoice_id: 36, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 37, status: "init")
    UserInvoice.create!(
      user_id: 8, invoice_id: 38, status: "waiting")
    UserInvoice.create!(
      user_id: 9, invoice_id: 39, status: "shipping")
    UserInvoice.create!(
      user_id: 10, invoice_id: 40, status: "shipped")
      UserInvoice.create!(
      user_id: 10, invoice_id: 41, status: "finished")
    UserInvoice.create!(
      user_id: 2, invoice_id: 42, status: "cancel")
    UserInvoice.create!(
      user_id: 10, invoice_id: 43, status: "init")
    UserInvoice.create!(
      user_id: 4, invoice_id: 44, status: "waiting")
    UserInvoice.create!(
      user_id: 5, invoice_id: 45, status: "shipping")
    UserInvoice.create!(
      user_id: 6, invoice_id: 46, status: "shipped")
    UserInvoice.create!(
      user_id: 7, invoice_id: 47, status: "finished")
    UserInvoice.create!(
      user_id: 8, invoice_id: 48, status: "cancel")
    UserInvoice.create!(
      user_id: 9, invoice_id: 49, status: "init")
    UserInvoice.create!(
      user_id: 10, invoice_id: 50, status: "waiting")
  end
end
