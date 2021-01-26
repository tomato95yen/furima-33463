class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area

  validates :prefecture_id, numericality: { other_than: 1 }
end
