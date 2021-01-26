class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new

  end


  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end
  
  private
  def order_params
    binding.pry
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number).merge(token: params[:token], user_id: params[:current_user.id])
  end
end
