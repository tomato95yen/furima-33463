require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordはとpassword_confirmationが不一致では登録できない' do
        @user.password = '00000a'
        @user.password_confirmation = '00000b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_nameは英字では登録できない' do
        @user.family_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameは数字では登録できない' do
        @user.family_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameは英字では登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameは数字では登録できない' do
        @user.first_name = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaは英字では登録できない' do
        @user.family_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'family_name_kanaは数字では登録できない' do
        @user.family_name_kana = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'family_name_kanaは漢字では登録できない' do
        @user.family_name_kana = '阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaは英字では登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaは数字では登録できない' do
        @user.first_name_kana = '0'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaは漢字では登録できない' do
        @user.first_name_kana = '阿'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      # 下記を追加しました
      it "passwordは全角では登録できないこと" do
        @user.password = "０００００ａ"
        @user.password_confirmation = "０００００ａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
