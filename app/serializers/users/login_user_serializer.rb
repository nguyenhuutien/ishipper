class Users::LoginUserSerializer < UserSerializer
  attributes :authentication_token, :device_id, :registration_id, :count_success_invoice,
    :count_total_invoice

  ["authentication_token", "registration_id", "device_id"].each do |arg|
    define_method("#{arg}") do
      if scope && scope[:user_token]
        user_token = scope[:user_token]
        user_token.send("#{arg}")
      else
        nil
      end
    end
  end

  def count_success_invoice
    if object.shipper?
      object.user_invoices.finished.size
    else
      object.invoices.finished.size
    end
  end

  def count_total_invoice
    if object.shipper?
      object.user_invoices.reject{|invoice| invoice.rejected?}.size
    else
      object.invoices.size
    end
  end
end
