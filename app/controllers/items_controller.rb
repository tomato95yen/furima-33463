class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :user_validate, only: :edit
  before_action :find_item, only: [:edit, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      @item = item
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id,
                                 :shipping_day_id, :item_price, :image).merge(user_id: current_user.id)
  end

  def user_validate
    item = Item.find(params[:id])
    redirect_to root_path if current_user.id != item.user_id
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
