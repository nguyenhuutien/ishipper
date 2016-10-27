class Supports::Invoice
  attr_reader :current_user

  def initialize current_user
    @current_user = current_user
  end

  ["all", "init", "waiting", "shipping", "shipped", "finished", "cancel"].each do |status|
    define_method status do
      instance_variable_set("@#{status}", @current_user.invoices.send(status)) unless
        instance_variable_get "@#{status}"
    end
  end
end
