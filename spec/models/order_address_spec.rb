require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが「3桁ハイフン4桁」の形式でないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが半角文字列でないと保存できない' do
        @order_address.postal_code = 'あああああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが選択されていないと保存できない' do
        @order_address.prefecture_id = "1"
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上11桁以内でないと保存できない' do
        @order_address.telephone_number = '123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short")
      end
      it 'telephone_numberが半角数値でないと保存できない' do
        @order_address.telephone_number = '１２３４５６７８９１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number is too short", "Telephone number is invalid. Input only number")
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
