require 'rails_helper'

RSpec.describe History, type: :model do
  describe '購入情報の保存' do
    before do
      @history = FactoryBot.build(:history)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@history).to be_valid
    end
  end
end
