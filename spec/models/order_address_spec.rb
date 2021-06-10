require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
      item.save
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名はなくても登録できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it '郵便番号がないと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列出ないと登録できない' do
        @order_address.postal_code = "11111111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が1だと登録できない' do
         @order_address.prefecture_id = 1
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないと登録できない' do
         @order_address.city = ''
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと登録できない' do
         @order_address.phone_number = ''
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は半角英数字混合では登録できない' do
        @order_address.phone_number = '12345aaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号は半角数値でないと登録できない' do
        @order_address.phone_number = '１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号は半角英語では登録できない' do
        @order_address.phone_number = 'eeeeeeeeeee'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号は、9桁以下の半角数値では登録できない' do
         @order_address.phone_number = '11111111'
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'userが紐づいていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
