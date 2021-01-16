class ItemsController < ApplicationController
  before_action :move_to_sign_in, only: [:new]
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
  end
end

private
def move_to_sign_in
  unless user_signed_in?
    redirect_to new_user_session_path
  end
end

def item_params
  params.require(:item).permit(:name, :explanation, :category_id, :condition_id, shipping_charge_id, shipping_area_id, shipping_day_id, item_price).merge(user_id: current_user.id)
end