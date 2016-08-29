namespace :db do
  desc "Import user_invoices"
  task user_invoices: [:environment] do

    (4..6).each do |n|
      (1..30).each do |m|
        user_id = n
        invoice_id = m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id, status: "init")
      end
    end

    (4..6).each do |n|
      (31..40).each do |m|
        user_id = n
        invoice_id = (n-4)*10 + m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "waiting")
      end
    end

    (4..6).each do |n|
      (61..70).each do |m|
        user_id = n
        invoice_id = (n-4)*10 + m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "shipping")
      end
    end

    (4..6).each do |n|
      (91..100).each do |m|
        user_id = n
        invoice_id = (n-4)*10 + m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "shipped")
      end
    end

    (4..6).each do |n|
      (121..130).each do |m|
        user_id = n
        invoice_id = (n-4)*10 + m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "finished")
      end
    end

    (4..6).each do |n|
      (151..160).each do |m|
        user_id = n
        invoice_id = (n-4)*10 + m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "cancel")
      end
    end

    (4..6).each do |n|
      (181..200).each do |m|
        user_id = n
        invoice_id = m
        UserInvoice.create!(
          user_id: user_id, invoice_id: invoice_id,
          status: "init")
      end
    end

    (181..200).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "init")
    end

    (201..210).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "waiting")
    end

    (211..220).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "shipping")
    end

    (221..230).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "shipped")
    end

    (231..240).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "finished")
    end

    (241..250).each do |m|
      user_id = 12
      invoice_id = m
      UserInvoice.create!(
        user_id: user_id, invoice_id: invoice_id,
        status: "cancel")
    end
  end
end
