class InvoiceStatus
  def initialize invoice, user_invoice, status
    @invoice = invoice
    @user_invoice = user_invoice
    @status = status
  end

  def shipper_update_status
    Invoice.transaction do
      UserInvoice.transaction do
        @invoice.update_attributes status: @status
        if @invoice.cancel?
          InvoiceHistoryCreator.new(@invoice).create_user_history(@user_invoice,
            @status)
          @user_invoice.destroy
        else
          @user_invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice).create_all_history(@user_invoice,
            @status)
        end
      end
    end
    rescue => e
    return false
  end

  def shop_update_status
    Invoice.transaction do
      UserInvoice.transaction do
        @invoice.update_attributes status: @status
        if @invoice.cancel?
          @invoice.user_invoices.each do |user_invoice|
            InvoiceHistoryCreator.new(@invoice).create_user_history(@user_invoice,
              @status)
            user_invoice.destroy if user_invoice.present?
          end
        else
          @user_invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice).create_all_history(@user_invoice,
            @status)
        end
      end
    end
    rescue => e
    return false
  end

  def accept_shipper
    Invoice.transaction do
      UserInvoice.transaction do
        @user_invoice.update_attributes status: @status
        @invoice.update_attributes status: @status
        InvoiceHistoryCreator.new(@invoice).create_invoice_history
        @user_invoice.invoice.user_invoices.each do |user_invoice|
          user_invoice.cancel! unless user_invoice == @user_invoice
          InvoiceHistoryCreator.new(@invoice).create_user_history(@user_invoice,
            @status)
        end
        true
      end
    end
    rescue =>e
    return false
  end
end
