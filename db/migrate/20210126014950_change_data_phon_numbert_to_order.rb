class ChangeDataPhonNumbertToOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :phone_number, :string
  end
end
