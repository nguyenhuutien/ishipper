class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :owner_id
      t.integer :recipient_id
      t.integer :content
      t.integer :user_invoice_id
      t.string :click_action
      t.boolean :read, default: false
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
