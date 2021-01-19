require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の新規登録' do
    context '新規登録できるとき' do
      it 'image,name,explanation,category_id,condition_id,shipping_charge_id,shipping_area_id,shipping_day_id,item_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーを選択しなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態を選択しなければ登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担について選択しなければ登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it '発送元の地域を選択しなければ登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送までの日数を選択しなければ登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
      it '価格を設定しなければ登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '価格は¥300以上でなければ登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than 299')
      end
      it '価格は¥9,999,999以下でなければ登録できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than 10000000')
      end
      it '価格は半角数字でなければ登録できない' do
        @item.item_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格は半角英語では登録できない' do
        @item.item_price = 'one'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it '価格は半角英数混合では登録できない' do
        @item.item_price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
