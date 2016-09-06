class Api::V1::Shop::InvoicesController < Api::ShopBaseController
  before_action :ensure_params_true, only: :index
  before_action :ensure_params_exist,  only: :create
  before_action :find_object, only: [:update, :destroy, :show]
  before_action :check_conditions_to_update_status?, only: :update

  def index
    invoices = if params[:status] == "all"
      current_user.invoices.search_invoice params[:querry]
    else
      current_user.invoices.send(params[:status]).search_invoice params[:querry]
    end
    render json: {message: I18n.t("invoices.messages.get_invoices_success"),
      data: {invoices: invoices}, code: 1}, status: 200
  end

  def show
    if @invoice.present?
      serializer = ActiveModelSerializers::SerializableResource.new(@invoice,
        each_serializer: InvoiceSerializer, scope: current_user).as_json
      render json: {message: I18n.t("invoices.show.success"),
        data: {invoice: serializer}, code: 1}, status: 200
    else
      render json: {message: I18n.t("invoices.messages.not_found"),
        data: {}, code: 0}, status: 200
    end
  end

  def create
    invoice = current_user.invoices.build invoice_params
    if invoice.save
      InvoiceHistoryCreator.new(invoice, current_user.id).create_history invoice_params
      render json: {message: I18n.t("invoices.create.success"),
        data: {invoice: invoice}, code: 1}, status: 201
    else
      render json: {message: error_messages(invoice.errors.messages), data: {},
        code: 0}, status: 200
    end
  end

  def update
    if params[:status]
      if InvoiceStatus.new(@invoice, @user_invoice, params[:status],
        current_user).shop_update_status
        render json: {message: I18n.t("invoices.messages.update_success"),
          data: {invoice: @invoice}, code: 1}, status: 200
      else
        render json: {message: I18n.t("invoices.messages.invoice_error_status"),
          data: {}, code: 0}, status: 200
      end
    else
      if @invoice.init?
        if InvoiceHistoryCreator.new(@invoice, current_user.id).create_history invoice_params
          render json: {message: I18n.t("invoices.update.success"),
            data:{invoice: @invoice}, code: 1}, status: 200
        else
          render json: {message: error_messages(@invoice.errors.messages), data: {},
            code: 0}, status: 200
        end
      else
        render json: {message: I18n.t("invoices.messages.cant_update"),
          data: {}, code: 0}, status: 200
      end
    end
  end

  def destroy
    if current_user == @invoice.user && @invoice.destroy
      render json: {message: I18n.t("invoices.delete.success"), data: {},
        code:1}, status: 200
    else
      render json: {message: I18n.t("invoices.delete.fails"), data: {},
        code:0},status: 200
    end
  end

  private
  def ensure_params_true
    statuses = Invoice.statuses
    statuses["all"] = 7
    unless (params[:status].nil? || params[:status].in?(statuses)) &&
      params.has_key?(:status)
      render json: {message: I18n.t("invoices.messages.missing_params"),
        data: {}, code: 0}, status: 422
    end
    unless params.has_key? :querry
      render json: {message: I18n.t("invoices.messages.missing_params"),
        data: {}, code: 0}, status: 422
    end
  end

  def invoice_params
    params.require(:invoice).permit Invoice::ATTRIBUTES_PARAMS
  end

  def check_conditions_to_update_status?
    statuses = Invoice.statuses
    if params[:status] && params[:status].in?(statuses)
      @user_invoice = @invoice.user_invoices.find_by status: @invoice.status
      if CheckConditions.new(@invoice, @user_invoice, params[:status]).shop_conditions? current_user
        render json: {message: I18n.t("invoices.messages.cant_update"),
          data: {}, code: 0}, status: 200
      end
    end
  end
  def ensure_params_exist
    if params[:invoice].nil? || params[:invoice][:name].nil? ||
      params[:invoice][:address_start].nil? || params[:invoice][:latitude_start].nil? ||
      params[:invoice][:longitude_start].nil? || params[:invoice][:address_finish].nil? ||
      params[:invoice][:latitude_finish].nil? || params[:invoice][:longitude_finish].nil? ||
      params[:invoice][:delivery_time].nil? || params[:invoice][:distance].nil? ||
      params[:invoice][:description].nil? || params[:invoice][:price].nil? ||
      params[:invoice][:shipping_price].nil? || params[:invoice][:weight].nil? ||
      params[:invoice][:customer_name].nil? ||  params[:invoice][:customer_number].nil?
      render json: {message: I18n.t("invoices.messages.missing_params"),
        data: {}, code: 0}, status: 422
    end
  end
end
