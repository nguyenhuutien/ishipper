class InvoiceServices::RealtimeVisibilityInvoiceService
  attr_reader :args

  def initialize args
    @recipients = args[:recipients]
    @invoice = args[:invoice]
    @action = args[:action]
  end

  def perform
    Invoices::RealtimeVisibilityInvoiceJob.perform_now recipients: @recipients,
      invoice: @invoice, action: @action
  end
end
