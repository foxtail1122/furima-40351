require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '商品情報が登録できるとき' do
      it '正常に登録できるとき' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない時' do
      it 'ユーザーが紐づいてなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '商品画像を1枚つけることが必須であること' do
        @item.image.key = ''
        @item.valid?
        expect(@item.errors.full_messages).to include{"Image can't be blank"}
      end

      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報が必須であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は￥299以下の場合は登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it '価格は￥1,000,000以上の場合は登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is invalid")
      end
      it '価格は半角数値でなければ登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
    end
  end
end
