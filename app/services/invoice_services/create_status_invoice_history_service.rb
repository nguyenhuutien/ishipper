class InvoiceServices::CreateStatusInvoiceHistoryService
  attr_reader :args

  def initialize args
    @invoice = args[:invoice]
  end

  def perform
    @invoice.status_invoice_histories.create! time: @invoice.updated_at.to_s,
      status: @invoice.status
  end
end
