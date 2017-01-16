class Simples::Shipper::ListShippersSimple < Simples::UsersSimple
  attr_accessor :online, :user_invoice_id, :favorite_user

  def online
    @object.online?
  end

  def user_invoice_id
    if @invoice
      @user_invoice = @invoice.user_invoices.find{|user_invoice|
        user_invoice.user_id == @object.id && user_invoice.status == @invoice.status}
      @user_invoice ? @user_invoice.id : 0
    else
      0
    end
  end
end
