class InvoiceStatus
  def initialize invoice, user_invoice, status
    @invoice = invoice
    @user_invoice = user_invoice
    @status = status
  end

  def update_status user
    Invoice.transaction do
      UserInvoice.transaction do
        @invoice.update_attributes status: @status
        if @invoice.cancel?
          if user.shipper?
            @user_invoice.destroy
          elsif user.shop?
            @invoice.user_invoices.each do |user_invoice|
              InvoiceHistoryCreator.new(@invoice).create_user_history(@user_invoice,
                @status)
              user_invoice.destroy if user_invoice.present?
            end
          end
        else
          InvoiceHistoryCreator.new(@invoice).create_all_history(@user_invoice,
            @status)
          @user_invoice.update_attributes status: @status
        end
      end
    end
    rescue => e
    return false
  end
end