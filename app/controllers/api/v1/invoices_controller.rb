class Api::V1::InvoicesController < Api::BaseController
  before_action :ensure_params_exist, only: :index

  def index
    invoices = Invoice.search params
    if invoices.any?
      serializers = ActiveModelSerializers::SerializableResource.new(invoices,
        each_serializer: InvoiceSerializer, scope: current_user).as_json
      render json: {message: I18n.t("invoices.messages.get_invoices_success"),
        data: {invoices: serializers}, code: 1}, status: 200
    else
      render json: {message: I18n.t("invoices.messages.get_invoices_fails"),
        data: {}, code: 1}, status: 200
    end
  end

  private
  def ensure_params_exist
    if params[:user].nil? && params[:invoice].nil?
      render json: {message: I18n.t("api.missing_params"), data: {}, code: 0},
        status: 422
    end
  end
end
