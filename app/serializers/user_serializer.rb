class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :address, :current_location, :latitude,
    :longitude, :phone_number, :plate_number, :role, :rate, :user_invoice_id

  def initialize object, params
    @object = object
    @params = ActionController::Parameters.new params
  end

  def user_invoice_id
    if @object.shipper? && @params[:invoice].present?
      @object.user_invoices.find_by_invoice_id(@params[:invoice][:id]).id
    else
      nil
    end
  end
end
