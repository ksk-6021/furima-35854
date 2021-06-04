require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
     @item = FactoryBot.build(:item)
     @item.image = fixture_file_upload('app/assets/images/furima-intro01.png')
  end


  describe '商品出品機能' do
    context '商品が出品できる時' do
      it 
      end
      it 
      end
    end
    context '商品が出品できない時' do
    end
  end
end
