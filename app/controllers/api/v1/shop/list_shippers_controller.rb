class Api::V1::Shop::ListShippersController < Api::ShopBaseController
  before_action :ensure_params_true, :check_owned_invoice, only: :index

  def index
    invoice = current_user.invoices.find_by id: params[:invoice][:id]
    shippers = invoice.all_shipper
    shippers = ActiveModelSerializers::SerializableResource.new(shippers,
      each_serializer: UserSerializer, scope: {invoice_id: params[:invoice][:id]})
    if shippers.blank?
      render json: {message: I18n.t("invoices.messages.get_shippers_fails"),
      data: {}, code: 1}, status: 200
    else
      render json: {message: I18n.t("invoices.messages.get_shippers_success"),
      data: {shippers: shippers}, code: 1}, status: 200
    end
  end

  private
  def ensure_params_true
    if params[:invoice].nil? or
      params[:invoice].class.to_s != "ActionController::Parameters" or
      params[:invoice][:id].nil?
      return render json:
        {message: I18n.t("invoices.messages.missing_params"), data: {}, code: 0},
        status: 422
    end
  end

  def check_owned_invoice
    current_invoice = current_user.invoices.find_by id: params[:invoice][:id]
    if current_invoice.nil?
      render json:
        {message: I18n.t("invoices.messages.invoice_not_exist"), data: {}, code: 0},
        status: 422
    end
  end
end
