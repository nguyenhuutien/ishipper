class Shop::InvoicesController < Shop::ShopBaseController
  load_and_authorize_resource

  def index
    @invoices = current_user.invoices.
      send(params[:invoice][:status]) if params[:invoice] && params[:invoice][:status]
  end

  def show
    @review = Review.new
  end

  def new
  end

  def create
    if params[:invoice_form_id] == "form_map_marker"
      @invoice = Invoice.new invoice_params
      error = CheckInvoiceMapMarker.new(@invoice).perform
      if error.present?
        flash[:danger] = error
        redirect_to new_shop_invoice_path
      end
    else
      if @invoice.save
        create_invoice_history = HistoryServices::CreateInvoiceHistoryService.new invoice: @invoice,
          creater_id: current_user.id
        create_invoice_history.perform
        passive_favorites = current_user.passive_favorites
        user_settings = UserSetting.near [@invoice.latitude_start, @invoice.longitude_start],
          Settings.max_distance, order: false
        near_shippers = User.users_by_user_setting(user_settings).shipper.users_online
        if passive_favorites.any?
          send_all_notification = NotificationServices::SendAllNotificationService.new owner: current_user,
            recipients: passive_favorites, status: "favorite", invoice: @invoice,
            click_action: Settings.invoice_detail
          send_all_notification.perform
        end
        serializer = ActiveModelSerializers::SerializableResource.new(@invoice,
          each_serializer: InvoiceSerializer, scope: current_user).as_json
        if near_shippers.any?
          realtime_visibility_shipper = InvoiceServices::RealtimeVisibilityInvoiceService.new recipients: near_shippers,
            invoice: serializer, action: Settings.realtime.new_invoice
          realtime_visibility_shipper.perform
        end
        flash[:success] = t "invoices.create.success"
        redirect_to root_path
      end
    end
  end

  def update
    check_update = if params[:status]
      @user_invoice = UserInvoice.find_by status: @invoice.status
      shop_update_invoice = InvoiceServices::ShopUpdateInvoiceService.new invoice: @invoice,
        user_invoice: @user_invoice, update_status: params[:status], current_user: current_user
      shop_update_invoice.perform?
    else
      @invoice.update_attributes invoice_params
    end
    if check_update
      flash[:success] = t "invoices.messages.update_success"
    else
      flash[:danger] = t "invoices.messages.cant_update"
    end
    redirect_to :back
  end

  private
  def invoice_params
    params.require(:invoice).permit Invoice::ATTRIBUTES_PARAMS
  end
end
