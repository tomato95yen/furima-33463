class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_validate, only: :edit
  before_action :find_item, only: [:edit, :show, :update]
  before_action :item_sold, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
    user_items = UserItem.all
    @item_ids = user_items.pluck(:item_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    user_items = UserItem.all
    @item_ids = user_items.pluck(:item_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
    item.destroy
    redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id,:shipping_day_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def user_validate
    item = Item.find(params[:id])
    redirect_to root_path if current_user.id != item.user_id
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def item_sold
    user_items = UserItem.all
    item_ids = user_items.pluck(:item_id)
    if item_ids.include?(params[:id].to_i)
      redirect_to root_path
    end
  end
end
