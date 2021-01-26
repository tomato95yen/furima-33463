class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_area
end
