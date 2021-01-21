class Order < ApplicationRecord
  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belings_to :shipping_area

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end
