class CreateUserTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tokens do |t|
      t.string :authentication_token
      t.string :device_id
      t.string :notification_token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
