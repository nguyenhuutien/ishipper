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
        if @status
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
            NotificationServices::CreateNotificationService.new(owner: @current_user,
              recipient: @invoice.user, content: @status, invoice: @invoice,
              click_action: click_action).perform
          end
        else
          return false
        end
      end
    end
    return true
    rescue => e
    return false
  end

  def shop_update_status
    Invoice.transaction do
      UserInvoice.transaction do
        if @status
          if @invoice.init?
            @invoice.update_attributes status: @status
            InvoiceHistoryCreator.new(@invoice, @current_user.id).create_invoice_history
            if @invoice.cancel?
              @invoice.user_invoices.each do |user_invoice|
                user_invoice.rejected!
                InvoiceHistoryCreator.new(@invoice, @current_user.id).
                  create_user_invoice_history user_invoice, "rejected"
              end
              near_shippers = User.near([@invoice.latitude_start, @invoice.longitude_start],
                Settings.max_distance).shipper.is_online
              if near_shippers.any?
                InvoiceServices::RealtimeVisibilityInvoiceService.new(recipients: near_shippers,
                  invoice: @invoice, action: Settings.realtime.remove_invoice).perform
              end
            end
          else
            @invoice.update_attributes status: @status
            @user_invoice.update_attributes status: @status
            InvoiceHistoryCreator.new(@invoice, @current_user.id).
              create_all_history @user_invoice, @status
            click_action = Settings.invoice_detail
            NotificationServices::CreateNotificationService.new(owner: @current_user,
              recipient: @user_invoice.user, content: @status, invoice: @invoice,
              click_action: click_action).perform
          end
        else
          return false
        end
      end
    end
    return true
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
        NotificationServices::CreateNotificationService.new(owner: @current_user,
          recipient: @user_invoice.user, content: @status, invoice: @invoice,
          click_action: click_action).perform
        @invoice.user_invoices.each do |user_invoice|
          unless @user_invoice == user_invoice
            user_invoice.rejected!
            InvoiceHistoryCreator.new(@invoice, @current_user.id).
              create_user_invoice_history user_invoice, "rejected"
          end
        end
        near_shippers = User.near([@invoice.latitude_start, @invoice.longitude_start],
          Settings.max_distance).shipper.is_online
        if near_shippers.any?
          InvoiceServices::RealtimeVisibilityInvoiceService.new(recipients: near_shippers,
            invoice: @invoice, action: Settings.realtime.remove_invoice).perform
        end
        true
      end
    end
    return true
    rescue =>e
    return false
  end

  def shop_update_attributes invoice_params
    (@status || !@invoice.init?) ? false : @invoice.update_attributes(invoice_params)
  end

  def check_conditions_to_update_status?
    if @status && Invoice.statuses.include?(@status)
      @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
      !CheckConditions.new(@invoice, @user_invoice, @status).shop_conditions? (@current_user)
    end
  end

  def shop_update?
    if check_conditions_to_update_status?
      if shop_update_status
        true
      elsif shop_update_attributes(@status)
        InvoiceHistoryCreator.new(@invoice, @current_user.id).create_invoice_history
        true
      else
        false
      end
    else
      false
    end
  end
end
