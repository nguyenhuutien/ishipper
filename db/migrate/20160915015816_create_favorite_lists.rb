class CreateFavoriteLists < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_lists do |t|
      t.integer :owner_id
      t.integer :favorite_list_user_id

      t.timestamps
    end
  end
end
