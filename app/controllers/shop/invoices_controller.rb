class Shop::InvoicesController < Shop::ShopBaseController
  load_and_authorize_resource

  def index
    @invoices = current_user.invoices.send(params[:status]) if params[:status]
    @invoices = @invoices.search_invoice(params[:name_invoice]).order_by_time if params[:name_invoice]
    @status = params[:status] if params[:status]
  end

  def show
    @list_back_status = params[:list_back_status] ||= "all"
    @support = Supports::Invoice.new invoice: @invoice, current_user: current_user
    render layout: false
  end

  def new
  end

  def create
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
      redirect_to shop_root_path
    end
  end

  def update
    @invoices = current_user.invoices.send params[:list_back_status]
    check_update = if params[:status]
      @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
      shop_update_invoice = InvoiceServices::ShopUpdateInvoiceService.new invoice: @invoice,
        user_invoice: @user_invoice, update_status: params[:status], current_user: current_user
      shop_update_invoice.perform?
    else
      @invoice.update_attributes invoice_params
    end
  end

  private
  def invoice_params
    params.require(:invoice).permit Invoice::ATTRIBUTES_PARAMS
  end
end
