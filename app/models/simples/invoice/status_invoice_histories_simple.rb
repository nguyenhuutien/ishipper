class Simples::Invoice::StatusInvoiceHistoriesSimple < Simples::BaseSimple
  attr_accessor :id, :time, :content

  def content
    I18n.t "status_history.#{@object.status}"
  end
end
