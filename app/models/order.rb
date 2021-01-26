class Order < ApplicationRecord
  attr_accessor :token
  validates :token, presence: true
  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 }
end
