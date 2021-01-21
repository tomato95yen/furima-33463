class Order < ApplicationRecord
  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belings_to :shipping_area

  validates :prefecture_id, numericality: { other_than: 1 }
end
