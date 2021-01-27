class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building_name
      t.integer :phone_number, null: false
      t.timestamps
    end
  end
end
