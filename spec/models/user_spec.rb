require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_reading,firts_name_reading,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録が出来ない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1a2b3c'
        @user.password_confirmation = '1b2a4cd'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'ababaaa'
        @user.password_confirmation = 'ababaaa'
        @user.valid?
        expect(@user.errors.full_messages). to include 'Password  is invalid. Include both letters and numbers'
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages). to include 'Password  is invalid. Include both letters and numbers'
      end
      it 'お名前(全角)は名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'お名前(全角)は名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'お名前(全角)はを名字を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name must be Full-width characters'
      end
      it 'お名前(全角)は名前を全角（漢字・ひらがな・カタカナ）で入力しないと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name must be Full-width characters'
      end
      it 'お名前カナ(全角)は名字が空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name reading can't be blank"
      end
      it 'お名前カナ(全角)は名前が空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name reading can't be blank"
      end
      it 'お名前カナ(全角)はを名字を全角カタカナで入力しないと登録できない' do
        @user.last_name_reading = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name reading must be Kana Full-width katakana characters'
      end
      it 'お名前カナ(全角)は名前を全角カタカナで入力しないと登録できない' do
        @user.first_name_reading = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name reading must be Kana Full-width katakana characters'
      end
      it '誕生日が空欄だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
