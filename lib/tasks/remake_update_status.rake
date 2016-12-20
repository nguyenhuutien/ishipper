namespace :db do
  desc "Import favorite_lists"
  task update_status: [:environment] do
    (1..5).each do |n|
      invoice_id = n
      shipper_id = 3

      invoice = Invoice.find_by_id invoice_id
      invoice.update_attributes status: "waiting"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => invoice.user.id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "waiting"
      user_invoice = invoice.user_invoices.find_by user_id: shipper_id
      user_invoice.update_attributes status: "waiting"
      invoice.user_invoices.init.each do |user_invoice|
        user_invoice.rejected!
        user_invoice.user_invoice_histories.create! status: "rejected", creater_id: invoice.user.id
      end
      Notification.create! owner_id: invoice.user.id, recipient_id: shipper_id,
        status: "waiting", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"
    end

    (6..10).each do |n|
      invoice_id = n
      shipper_id = 3

      invoice = Invoice.find_by_id invoice_id
      invoice.update_attributes status: "waiting"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => invoice.user.id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "waiting"
      user_invoice = invoice.user_invoices.find_by user_id: shipper_id
      user_invoice.update_attributes status: "waiting"
      invoice.user_invoices.init.each do |user_invoice|
        user_invoice.rejected!
        user_invoice.user_invoice_histories.create! status: "rejected", creater_id: invoice.user.id
      end
      Notification.create! owner_id: invoice.user.id, recipient_id: shipper_id,
        status: "waiting", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"

      invoice.update_attributes status: "shipping"
      user_invoice.update_attributes status: "shipping"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => shipper_id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "shipping"
      Notification.create! owner_id: shipper_id, recipient_id: invoice.user.id,
        status: "shipping", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"
    end

    (11..15).each do |n|
      invoice_id = n
      shipper_id = 3

      invoice = Invoice.find_by_id invoice_id
      invoice.update_attributes status: "waiting"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => invoice.user.id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "waiting"
      user_invoice = invoice.user_invoices.find_by user_id: shipper_id
      user_invoice.update_attributes status: "waiting"
      invoice.user_invoices.init.each do |user_invoice|
        user_invoice.rejected!
        user_invoice.user_invoice_histories.create! status: "rejected", creater_id: invoice.user.id
      end
      Notification.create! owner_id: invoice.user.id, recipient_id: shipper_id,
        status: "waiting", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"

      invoice.update_attributes status: "shipping"
      user_invoice.update_attributes status: "shipping"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => shipper_id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "shipping"
      Notification.create! owner_id: shipper_id, recipient_id: invoice.user.id,
        status: "shipping", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"

      invoice.update_attributes status: "shipped"
      user_invoice.update_attributes status: "shipped"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => shipper_id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "shipped"
      Notification.create! owner_id: shipper_id, recipient_id: invoice.user.id,
        status: "shipped", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"
      rate = invoice.reviews.create owner_id: shipper_id, recipient_id: invoice.user.id,
        review_type: "rate", rating_point: 4, content: "rat tot"
    end

    (13..15).each do |n|
      invoice_id = n
      shipper_id = 3

      invoice = Invoice.find_by_id invoice_id
      user_invoice = invoice.user_invoices.find_by user_id: shipper_id
      invoice.update_attributes status: "finished"
      user_invoice.update_attributes status: "finished"
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params.merge "creater_id" => shipper_id
      invoice.invoice_histories.create! invoice_params
      invoice.status_invoice_histories.create! time: invoice.updated_at.to_s,
        status: "finished"
      Notification.create! owner_id: invoice.user.id, recipient_id: shipper_id,
        status: "finished", invoice_id: invoice.id, user_invoice_id: user_invoice.id,
        click_action: "com.framgia.ishipper.INVOICE_DETAIL"
      rate = invoice.reviews.create owner_id: invoice.user.id, recipient_id: shipper_id,
        review_type: "rate", rating_point: 4, content: "rat tot"
    end
  end
end
