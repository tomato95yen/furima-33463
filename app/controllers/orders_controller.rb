class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :item_sold
  before_action :item_owner
  before_action :find_item, only: [:index, :create]

  def index
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    if @history.valid?
      pay_item
      @history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def history_params
    params.require(:history).permit(:postal_code, :prefecture_id, :city, :block, :building_name, :phone_number, :user_item_id, :user_id).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def item_sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.user_item.present?
  end

  def item_owner
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
