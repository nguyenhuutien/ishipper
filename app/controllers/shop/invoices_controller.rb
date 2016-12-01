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
        HistoryServices::CreateInvoiceHistoryService.new(invoice: @invoice,
          creater_id: current_user.id).perform
        passive_favorites = current_user.passive_favorites
        near_shippers = User.near([@invoice.latitude_start, @invoice.longitude_start],
          Settings.max_distance).shipper.users_online
        if passive_favorites.any?
          NotificationServices::SendAllNotificationService.new(owner: current_user,
            recipients: passive_favorites, status: "favorite", invoice: @invoice,
            click_action: Settings.invoice_detail).perform
        end
        serializer = ActiveModelSerializers::SerializableResource.new(@invoice,
          each_serializer: InvoiceSerializer, scope: current_user).as_json
        if near_shippers.any?
          InvoiceServices::RealtimeVisibilityInvoiceService.new(recipients: near_shippers,
            invoice: serializer, action: Settings.realtime.new_invoice).perform
        end
        flash[:success] = t "invoices.create.success"
        redirect_to root_path
      end
    end
  end

  def update
    if InvoiceServices::ShopUpdateInvoiceService.new(invoice: @invoice,
      user_invoice: @user_invoice, status: (params[:status] || invoice_params),
      current_user: current_user).perform?
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
