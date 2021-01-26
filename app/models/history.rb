class History
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
    validates :token
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)

    Order.create(postal_code: postal_code, prefecture_id: prefecture_id,city: city, block: block,phone_number: phone_number, user_item_id: user_item.id )
  end
end