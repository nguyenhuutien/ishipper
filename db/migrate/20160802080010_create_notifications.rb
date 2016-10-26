class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :owner_id
      t.integer :recipient_id
      t.integer :content
      t.integer :invoice_id
      t.integer :user_invoice_id
      t.string :click_action

      t.timestamps
    end
  end
end
