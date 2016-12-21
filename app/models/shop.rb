class Shop < User
  include StiRouting

  has_many :invoices, foreign_key: "user_id", dependent: :destroy

  def list_shipper_received
    ids = "SELECT DISTINCT user_invoices.user_id FROM users JOIN invoices ON
      users.id = invoices.user_id JOIN user_invoices ON
      user_invoices.invoice_id = invoices.id WHERE users.id = #{self.id}"
    User.where "id IN (#{ids})"
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
