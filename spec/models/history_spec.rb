require 'rails_helper'

RSpec.describe History, type: :model do
  before do
    @history = FactoryBot.build(:history)
  end
  describe '購入情報の保存' do
    context '購入情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@history).to be_valid
      end
      it '建物名が空でも保存できる' do
        @history.building_name = ''
        expect(@history).to be_valid
      end
    end
    context '購入情報が保存できないとき' do
      it '郵便番号が空だと保存できない' do
        @history.postal_code = ''
        @history.valid?
        expect(@history.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は[-]も含めなければ保存できない' do
        @history.postal_code = '0000000'
        @history.valid?
        expect(@history.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は３桁[-]4桁でなければ保存できない' do
        @history.postal_code = '0000-000'
        @history.valid?
        expect(@history.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号は半角数字でなければ保存できない' do
        @history.postal_code = '０００-００００'
        @history.valid?
        expect(@history.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県が未選択では保存できない' do
        @history.prefecture_id = 1
        @history.valid?
        expect(@history.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村が空では保存できない' do
        @history.city = ''
        @history.valid?
        expect(@history.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @history.block = ''
        @history.valid?
        expect(@history.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空では保存できない' do
        @history.phone_number = "Phone number can't be blank"
        @history.valid?
        expect(@history.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は11桁以内でないと保存できない' do
        @history.phone_number = '000000000000'
        @history.valid?
        expect(@history.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は半角数字でないと保存できない' do
        @history.phone_number = '０００００００００００'
        @history.valid?
        expect(@history.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できない' do
        @history.token = ''
        @history.valid?
        expect(@history.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @history.user_id = ""
        @history.valid?
        expect(@history.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @history.item_id = ""
        @history.valid?
        expect(@history.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
