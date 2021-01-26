class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_sold
  def index
    @item = Item.find(params[:item_id])
    @history = History.new
  end


  def create
    @item = Item.find(params[:item_id])
    @history = History.new(history_params)
    if @history.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: history_params[:token],
        currency: 'jpy'
      )
      @history.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  def history_params
    params.require(:history).permit(:postal_code,:prefecture_id, :city, :block, :phone_number, :user_item_id, :user_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id )
  end

  def item_sold
    user_items = UserItem.all
    item_ids = user_items.pluck(:item_id)
    @item = Item.find(params[:item_id])
    if item_ids.include?(@item.id)
      redirect_to root_path
    end
  end
end
