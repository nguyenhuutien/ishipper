class InvoiceStatus
  def initialize invoice, user_invoice, status, current_user
    @invoice = invoice
    @user_invoice = user_invoice
    @status = status
    @current_user = current_user
  end

  def shipper_update_status
    Invoice.transaction do
      UserInvoice.transaction do
        @invoice.update_attributes status: @status
        @user_invoice.update_attributes status: @status
        InvoiceHistoryCreator.new(@invoice, @current_user.id).
          create_all_history @user_invoice, @status
      end
    end
    rescue => e
    return false
  end

  def shop_update_status
    Invoice.transaction do
      UserInvoice.transaction do
        if @invoice.init?
          @invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice, @current_user.id).create_invoice_history
          if @invoice.cancel?
            @invoice.user_invoices.each do |user_invoice|
              user_invoice.reject!
              InvoiceHistoryCreator.new(@invoice, @current_user.id).
                create_user_invoice_history user_invoice, "reject"
            end
          end
        else
          @invoice.update_attributes status: @status
          @user_invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice, @current_user.id).
            create_all_history @user_invoice, @status
        end
      end
    end
    rescue => e
    return false
  end

# phan nay la phan xu ly update status + create history cua Tien, em de lai de so sanh,
# neu dc merge thi pull tiep theo se xoa
  # def shipper_update_status
  #   Invoice.transaction do
  #     UserInvoice.transaction do
  #       @invoice.update_attributes status: @status
  #       @user_invoice.update_attributes status: @status
  #       if @invoice.cancel?
  #         InvoiceHistoryCreator.new(@invoice, @current_user).create_user_invoice_history(@user_invoice,
  #           @status)
  #         @user_invoice.destroy
  #       else
  #         @user_invoice.update_attributes status: @status
  #         InvoiceHistoryCreator.new(@invoice, @current_user).create_all_history(@user_invoice,
  #           @status)
  #       end
  #     end
  #   end
  #   rescue => e
  #   return false
  # end

  # def shop_update_status
  #   Invoice.transaction do
  #     UserInvoice.transaction do
  #       @invoice.update_attributes status: @status
  #       if @invoice.cancel?
  #         @invoice.user_invoices.each do |user_invoice|
  #           InvoiceHistoryCreator.new(@invoice, @current_user).create_user_invoice_history(@user_invoice,
  #             @status)
  #           user_invoice.destroy if user_invoice.present?
  #         end
  #       else
  #         @user_invoice.update_attributes status: @status
  #         InvoiceHistoryCreator.new(@invoice, @current_user).create_all_history(@user_invoice,
  #           @status)
  #       end
  #     end
  #   end
  #   rescue => e
  #   return false
  # end

  def accept_shipper
    Invoice.transaction do
      UserInvoice.transaction do
        @user_invoice.update_attributes status: @status
        @invoice.update_attributes status: @status
        InvoiceHistoryCreator.new(@invoice, @current_user.id).
          create_all_history @user_invoice, @status
        @invoice.user_invoices.each do |user_invoice|
          unless @user_invoice == user_invoice
            user_invoice.reject!
            InvoiceHistoryCreator.new(@invoice, @current_user.id).
              create_user_invoice_history user_invoice, "reject"
          end
        end
        true
      end
    end
    rescue =>e
    return false
  end
end
