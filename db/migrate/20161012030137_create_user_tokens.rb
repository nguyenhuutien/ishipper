class CreateUserTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tokens do |t|
      t.string :authentication_token
      t.string :device_id
      t.string :registration_id
      t.boolean :online, default: true
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
