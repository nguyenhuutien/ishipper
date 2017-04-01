namespace :db do
  desc "Import favorite_lists"
  task update_status: [:environment] do

    shipper_id = 3
    invoice_histories = []
    status_invoice_histories = []
    user_invoice_histories = []
    notifications = []
    reviews = []

    load_invoice1 = Invoice.where id: 3..5
    load_invoice1.each do |invoice|

      invoice.waiting!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "waiting", invoice_id: invoice.id)
    end

    load_user_invoice1 = UserInvoice.where invoice_id: 3..5
    load_user_invoice1.each do |user_invoice|
      if user_invoice.user_id == shipper_id
        user_invoice.waiting!
        user_invoice_histories << UserInvoiceHistory.new(status: "waiting",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: user_invoice.invoice.user_id, recipient_id: shipper_id,
          status: "waiting", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")
      else
        user_invoice.rejected!
        user_invoice_histories << UserInvoiceHistory.new(status: "rejected",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
      end
    end

    load_invoice2 = Invoice.where id: 6..10
    load_invoice2.each do |invoice|

      invoice.waiting!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "waiting", invoice_id: invoice.id)

      invoice.shipping!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => shipper_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "shipping", invoice_id: invoice.id)
    end

    load_user_invoice2 = UserInvoice.where invoice_id: 6..10
    load_user_invoice2.each do |user_invoice|
      if user_invoice.user_id == shipper_id

        user_invoice.waiting!
        user_invoice_histories << UserInvoiceHistory.new(status: "waiting",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: user_invoice.invoice.user_id, recipient_id: shipper_id,
          status: "waiting", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.shipping!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipping",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: shipper_id, recipient_id: user_invoice.invoice.user_id,
          status: "shipping", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")
      else
        user_invoice.rejected!
        user_invoice_histories << UserInvoiceHistory.new(status: "rejected",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
      end
    end

    load_invoice3 = Invoice.where id: 11..12
    load_invoice3.each do |invoice|

      invoice.waiting!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "waiting", invoice_id: invoice.id)

      invoice.shipping!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => shipper_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "shipping", invoice_id: invoice.id)

      invoice.shipped!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => shipper_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "shipped", invoice_id: invoice.id)

      reviews << Review.new(owner_id: shipper_id, recipient_id: invoice.user.id,
        review_type: "rate", rating_point: 4, content: "day la noi dung cua review",
        invoice_id: invoice.id)
    end

    load_user_invoice3 = UserInvoice.where invoice_id: 11..12
    load_user_invoice3.each do |user_invoice|
      if user_invoice.user_id == shipper_id

        user_invoice.waiting!
        user_invoice_histories << UserInvoiceHistory.new(status: "waiting",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: user_invoice.invoice.user_id, recipient_id: shipper_id,
          status: "waiting", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.shipping!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipping",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: shipper_id, recipient_id: user_invoice.invoice.user_id,
          status: "shipping", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.shipped!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipped",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: shipper_id, recipient_id: user_invoice.invoice.user_id,
          status: "shipped", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")
      else
        user_invoice.rejected!
        user_invoice_histories << UserInvoiceHistory.new(status: "rejected",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
      end
    end

    load_invoice4 = Invoice.where id: 13..15
    load_invoice4.each do |invoice|

      invoice.waiting!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "waiting", invoice_id: invoice.id)

      invoice.shipping!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => shipper_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "shipping", invoice_id: invoice.id)

      invoice.shipped!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => shipper_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "shipped", invoice_id: invoice.id)

      reviews << Review.new(owner_id: shipper_id, recipient_id: invoice.user.id,
        review_type: "rate", rating_point: 4, content: "day la noi dung cua review",
        invoice_id: invoice.id)

      invoice.finished!
      invoice_params = invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
      invoice_params = invoice_params.merge "invoice_id" => invoice.id
      invoice_params = invoice_params.merge "creater_id" => invoice.user_id
      invoice_histories << InvoiceHistory.new(invoice_params)
      status_invoice_histories << StatusInvoiceHistory.new(time: invoice.updated_at.to_s,
        status: "finished", invoice_id: invoice.id)

      reviews << Review.new(owner_id: invoice.user_id, recipient_id: shipper_id,
        review_type: "rate", rating_point: 4, content: "day la noi dung cua review",
        invoice_id: invoice.id)

    end

    load_user_invoice4 = UserInvoice.where invoice_id: 13..15
    load_user_invoice4.each do |user_invoice|
      if user_invoice.user_id == shipper_id

        user_invoice.waiting!
        user_invoice_histories << UserInvoiceHistory.new(status: "waiting",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: user_invoice.invoice.user_id, recipient_id: shipper_id,
          status: "waiting", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.shipping!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipping",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: shipper_id, recipient_id: user_invoice.invoice.user_id,
          status: "shipping", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.shipped!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipped",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: shipper_id, recipient_id: user_invoice.invoice.user_id,
          status: "shipped", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")

        user_invoice.finished!
        user_invoice_histories << UserInvoiceHistory.new(status: "shipped",
          creater_id: shipper_id, user_invoice_id: user_invoice.id)
        notifications << Notification.new(owner_id: user_invoice.invoice.user_id, recipient_id: shipper_id,
          status: "shipped", invoice_id: user_invoice.invoice_id, user_invoice_id: user_invoice.id,
          click_action: "com.framgia.ishipper.INVOICE_DETAIL")
      else
        user_invoice.rejected!
        user_invoice_histories << UserInvoiceHistory.new(status: "rejected",
          creater_id: user_invoice.invoice.user_id, user_invoice_id: user_invoice.id)
      end
    end
    InvoiceHistory.import invoice_histories
    StatusInvoiceHistory.import status_invoice_histories
    UserInvoiceHistory.import user_invoice_histories
    Notification.import notifications
    Review.import reviews
  end
end
