class Shop < User
  include StiRouting

  has_many :invoices, foreign_key: "user_id", dependent: :destroy

  def list_shipper_received
    ids = "SELECT DISTINCT user_invoices.user_id FROM users JOIN invoices ON
      users.id = invoices.user_id JOIN user_invoices ON
      user_invoices.invoice_id = invoices.id WHERE users.id = #{self.id}"
    User.where "id IN (#{ids})"
  end
end
