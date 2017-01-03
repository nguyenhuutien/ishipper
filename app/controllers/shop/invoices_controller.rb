class Shop::InvoicesController < Shop::ShopBaseController
  load_and_authorize_resource

  def index
    @invoices = @invoices.order_by_update_time
    if params[:status]
      @invoices = @invoices.send params[:status]
      @load_more = true if params[:load_more] == '1'
      @status = params[:status]
    end
    @invoices = @invoices.search_invoice(params[:type], params[:data]) if params[:type]
    @invoices = @invoices.page(params[:page]).per Settings.per_list_invoice
  end

  def show
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

  def edit
  end

  def update
    check_update = if params[:status]
      @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
      shop_update_invoice = InvoiceServices::ShopUpdateInvoiceService.new invoice: @invoice,
        user_invoice: @user_invoice, update_status: params[:status], current_user: current_user
      shop_update_invoice.perform?
      @invoice.type_update = Settings.type_update.status
    else
      @invoice.update_attributes invoice_update_params
      @invoice.type_update = Settings.type_update.invoice
    end
    if check_update
      flash[:success] = t "invoices.messages.update_success"
    else
      flash[:danger] = t "invoices.messages.cant_update"
    end
  end

  private
  def invoice_params
    params.require(:invoice).permit Invoice::ATTRIBUTES_PARAMS
  end

  def invoice_update_params
    params.require(:invoice).permit Invoice::UPDATE_ATTRIBUTES_PARAMS
  end
end
