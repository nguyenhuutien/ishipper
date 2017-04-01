class Shop < User
  include StiRouting

  has_many :invoices, foreign_key: "user_id", dependent: :destroy

  has_one :shop_setting, foreign_key: "user_id", dependent: :destroy

  def list_shipper_received
    invoice_ids = self.invoices.ids
    user_invoices = UserInvoice.where(invoice_id: invoice_ids).select(:user_id).distinct
    User.where id: user_invoices.map{|user_invoice| user_invoice.user_id}
  end

  ["favorite_list", "black_list"].permutation(2).to_a.each do |arg|
    arg.each_cons(2) do |arg1, arg2|
      define_method("add_to_#{arg1}") do |id|
        list2 = "#{arg2}".split('_').map(&:capitalize).join('').constantize.
          find_by "#{arg2}_user_id": id, owner_id: self.id
        list2.destroy if list2
        list1 = "#{arg1}".split('_').map(&:capitalize).join('').constantize.
          new "#{arg1}_user_id": id, owner_id: self.id
        true if list1.save
      end

      define_method("remove_from_#{arg1}") do |id|
        list = "#{arg1}".split('_').map(&:capitalize).join('').constantize.
          find_by "#{arg1}_user_id": id, owner_id: self.id
        true if list && list.destroy
      end
    end
  end
end
