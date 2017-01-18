class Simples::Invoice::ShopInvoicesSimple < Simples::InvoicesSimple
  attr_accessor :user, :status_histories, :number_of_recipients

  def user
    users_simple = Simples::UsersSimple.new object: @object.user
    users_simple.simple
  end

  def status_histories
    if @object.init?
      nil
    else
      status_history = Simples::Invoice::StatusInvoiceHistoriesSimple.
        new object: @object.status_invoice_histories
      status_history.simple
    end
  end

  def number_of_recipients
    if @object.init?
      @object.number_of_recipients
    end
  end
end
