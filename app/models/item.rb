class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :user_id
  end
  validates :item_price, presence: true, numericality:{only_integer: true, geater_than: 300, less_than: 9999999}, format: {with: /\A[0-9]+\z/}
  
end
