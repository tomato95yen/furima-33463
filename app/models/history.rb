class History
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with:/\A\d{,11}\z/ }
    validates :token
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)

    Order.create(postal_code: postal_code, prefecture_id: prefecture_id,city: city, block: block,phone_number: phone_number, user_item_id: user_item.id )
  end
end