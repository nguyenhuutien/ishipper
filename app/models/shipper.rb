class Shipper < User
  include StiRouting

  has_many :user_invoices, foreign_key: "user_id", dependent: :destroy

  has_one :shipper_setting, foreign_key: "user_id", dependent: :destroy

  def invoices
    invoice_ids = self.user_invoices.collect{|user_invoice|
      user_invoice.invoice_id unless user_invoice.rejected?}
    Invoice.where id: invoice_ids
  end
end
