require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
     @item = FactoryBot.build(:item)
     @item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end


  describe '商品出品機能' do
    context '商品が出品できる時' do
      it '全ての情報が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが1以外であれば出品できる'do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '価格は半角数値であれば出品できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない時' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーの情報は1以外でないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態の情報がないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '商品の状態の情報は1以外でないと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料の負担の情報がないと出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end
      it '配送料の負担の情報は1以外でないと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it '発送元の地域の情報がないと出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area is not a number")
      end
      it '発送元の地域の情報は1以外でないと出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '発送までの日数の情報がないと出品できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time is not a number")
      end
      it '発送までの日数は1以外でないと出品できない' do
        @item.shipping_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time must be other than 1")
      end
      it '価格の情報がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は範囲内でないと出品できない' do
        @item.price = 100
        @item.valid?
      end
      it '価格は半角数値でないと出品できない' do
        @item.price = '５００'
        @item.valid?
      end
    end
  end
end
