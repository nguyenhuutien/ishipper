class Simples::User::LoginUsersSimple < Simples::UsersSimple
  attr_accessor :authentication_token, :device_id, :registration_id, :count_success_invoice,
    :count_total_invoice

  ["authentication_token", "registration_id", "device_id"].each do |arg|
    define_method("#{arg}") do
      @user_token ? @user_token.send(arg) : nil
    end
  end

  def count_success_invoice
    if @object.shipper?
      @object.user_invoices.select{|user_invoice| user_invoice if user_invoice.finished?}.size
    else
      @object.invoices.select{|invoice| invoice if invoice.finished?}.size
    end
  end

  def count_total_invoice
    if @object.shipper?
      @object.user_invoices.reject{|invoice| invoice.rejected?}.size
    else
      @object.invoices.size
    end
  end
end
