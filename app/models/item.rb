class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 },
                         format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end
