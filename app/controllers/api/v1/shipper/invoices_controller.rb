class Api::V1::Shipper::InvoicesController < Api::ShipperBaseController
  before_action :find_object, only: [:update, :show]
  before_action :ensure_params_true, only: [:index, :update]
  before_action :check_conditions_to_update_status?, only: :update

  def index
    invoices = if params[:status] == "all"
      current_user.all_user_invoices.search_invoice params[:querry]
    else
      current_user.all_user_invoices.send params[:status].search_invoice params[:querry]
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

  def update
    if InvoiceStatus.new(@invoice, @user_invoice, params[:status],
      current_user).shipper_update_status
      render json: {message: I18n.t("invoices.messages.update_success"),
        data: {invoice: @invoice}, code: 1}, status: 200
    else
      render json: {message: I18n.t("invoices.messages.update_fail"),
        data: {}, code: 0}, status: 200
    end
  end

  private
  def ensure_params_true
    statuses = UserInvoice.statuses
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

  def check_conditions_to_update_status?
    @user_invoice = @invoice.user_invoices.find_by user_id: current_user.id,
      status: @invoice.status
    if CheckConditions.new(@invoice, @user_invoice, params[:status]).shipper_conditions?
      render json: {message: I18n.t("invoices.messages.cant_update"),
        data: {}, code: 0}, status: 200
    end
  end
end
