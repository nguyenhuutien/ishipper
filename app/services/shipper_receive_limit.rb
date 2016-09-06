class ShipperReceiveLimit
  def initialize user_invoices, user_id
    @user_invoices = user_invoices
    @id = user_id
  end

  def update_status
    @user_invoices.each do |user_invoice|
      user_invoice.reject!
      InvoiceHistoryCreator.new(@invoice, @id).
        create_user_invoice_history user_invoice, "reject"
    end
  end

  def check_new_shipper?
    current_invoices = User.find_by(id: @id).user_invoices
    @shipper_invoices = current_invoices.waiting.count +
      current_invoices.shipping.count + current_invoices.shipped.count +
      current_invoices.finished.count
    @shipper_invoices < Settings.new_shipper_invoice
  end

  def check_old_shipper?
    current_invoices = User.find_by(id: @id).user_invoices
    old_shipper = current_invoices.waiting.count + current_invoices.shipping.count
    old_shipper < Settings.max_invoice &&
      current_invoices.shipped.count < Settings.check_shipped_invoice
  end
end
