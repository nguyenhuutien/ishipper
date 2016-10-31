class CreateUserSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_settings do |t|
      t.boolean :receive_notification, default: true
      t.integer :unread_notification
      t.float :radius_display, default: 5
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
