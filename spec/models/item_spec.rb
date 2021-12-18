require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/065.png')
  end


  describe "商品出品" do
    context '商品出品できるとき' do
      it 'item_name,explanation,image,category_id,status_id,prefecture_id,shipping_cost_id,time_to_ship_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "item_nameが空だと登録できない" do
        @item.item_name= ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "status_idが空だと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "shipping_cost_idが空だと登録できない" do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it "time_to_ship_idが空だと登録できない" do
        @item.time_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Time to ship can't be blank"
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが半角数字以外だと登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
    end
  end
end

