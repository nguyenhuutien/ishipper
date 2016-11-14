class InvoiceHistoryCreator
  def initialize invoice, owner_id
    @invoice = invoice
    @id = owner_id
  end

  def create_history invoice_params
    if @invoice.update_attributes invoice_params
      create_invoice_history
      return true
    else
      return false
    end
  end

  def create_invoice_history
    invoice_params = @invoice.attributes.without *Invoice::REJECT_ATTRIBUTES
    invoice_params.merge "creater_id" => @id
    @invoice.invoice_histories.create! invoice_params
  end

  def create_user_invoice_history user_invoice, status
    UserInvoiceHistory.create! status: status,
      user_invoice_id: user_invoice.id, creater_id: @id
  end

  def create_all_history user_invoice, status
    create_invoice_history
    create_user_invoice_history user_invoice, status
  end
end
