class Invoices::ShopInvoiceSerializer < InvoiceSerializer
  attributes :customer_number, :customer_name
  attribute :user, if: :condition?
  attribute :number_of_recipients, unless: :condition?
  attribute :status_histories, if: :condition?

  def user
    user_invoice = UserInvoice.find_by invoice_id: object.id, status: object.status
    if user_invoice
      serializer = ActiveModelSerializers::SerializableResource.new(user_invoice.user,
        scope: {current_user: user_invoice.user}).as_json
    end
  end

  def number_of_recipients
    object.user_invoices.size
  end
end
