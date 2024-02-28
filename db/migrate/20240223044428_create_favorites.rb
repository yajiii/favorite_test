class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :shop, null: true, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:user_id, :shop_id], unique: true
    add_index :favorites, [:user_id, :product_id], unique: true
  end
end
