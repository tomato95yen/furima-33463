class ChangeDataPostalCodeToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :postal_code, :string
  end
end
