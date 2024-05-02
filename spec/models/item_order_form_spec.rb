require 'rails_helper'

RSpec.describe ItemOrderForm, type: :model do
  before do
    @item_order_form = FactoryBot.build(:item_order_form)
    sleep(0.1)
  end

  context '内容に問題ない場合' do
    it "入力項目に有効な値が存在する時" do
      expect(@item_order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do

    it 'ユーザーが紐づいてなければ出品できない' do
      @item_order_form.user_id = nil
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("User can't be blank")
    end
    it '品物が紐づいてなければ出品できない' do
      @item_order_form.item_id = nil
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できない" do
      @item_order_form.token = nil
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が必須であること' do
      @item_order_form.postal_code = ''
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンが含まれなければならない' do
      @item_order_form.postal_code = 2222222
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県についての情報が必須であること' do
      @item_order_form.prefecture_id = 1
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が空では登録できない' do
      @item_order_form.city = ''
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では登録できない' do
      @item_order_form.adress = ''
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Adress can't be blank")
    end
    it '電話番号が必須であること' do
      @item_order_form.phone_number = ''
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が9桁以下であれば保存できない' do
      @item_order_form.phone_number = 102020202
      @item_order_form.valid?
      expect(@item_order_form.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
