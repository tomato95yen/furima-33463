class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end


  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(item_order: current_user.id)
  end
end
