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
        if @user_invoice.init? && @status == "rejected"
          @user_invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice, @current_user.id).
            create_user_invoice_history @user_invoice, "rejected"
        else
          @invoice.update_attributes status: @status
          @user_invoice.update_attributes status: @status
          InvoiceHistoryCreator.new(@invoice, @current_user.id).
            create_all_history @user_invoice, @status
          click_action = Settings.invoice_detail
          CreateNotification.new(owner: @current_user, recipient: @invoice.user,
            content: @status, invoice: @invoice, user_invoice: @user_invoice,
            click_action: click_action).perform
        end
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
              user_invoice.rejected!
              InvoiceHistoryCreator.new(@invoice, @current_user.id).
                create_user_invoice_history user_invoice, "rejected"
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

  def accept_shipper
    Invoice.transaction do
      UserInvoice.transaction do
        @user_invoice.update_attributes status: @status
        @invoice.update_attributes status: @status
        # sau se transaction  cho history, notification va 1 service phuc vu 1 tac vu
        InvoiceHistoryCreator.new(@invoice, @current_user.id).
          create_all_history @user_invoice, @status
        click_action = Settings.invoice_detail
        CreateNotification.new(owner: @current_user, recipient: @user_invoice.user,
          content: @status, invoice: @invoice, user_invoice: @user_invoice,
          click_action: click_action).perform
        @invoice.user_invoices.each do |user_invoice|
          unless @user_invoice == user_invoice
            user_invoice.rejected!
            InvoiceHistoryCreator.new(@invoice, @current_user.id).
              create_user_invoice_history user_invoice, "rejected"
          end
        end
        true
      end
    end
    rescue =>e
    return false
  end
end
