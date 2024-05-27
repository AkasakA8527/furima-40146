require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, item_id: item.id)
  end

  describe '購入情報入力' do
    context '購入できる場合' do
      it 'token, postal_code, prefecture, city, house_number, building_name, phone_numberが存在すれば登録できる' do
        expect(@order_purchase).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_purchase.building_name = ''
        @order_purchase.valid?
        expect(@order_purchase).to be_valid
      end
    end

    context '購入できない場合' do
      it 'userが空では登録できない' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが空では登録できない' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @order_purchase.token = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @order_purchase.postal_code = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが正しい記載でないと登録できない' do
        @order_purchase.postal_code = '8765432'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空では登録できない' do
        @order_purchase.prefecture_id = '1'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_purchase.city = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @order_purchase.house_number = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_purchase.phone_number = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @order_purchase.phone_number = '080123456'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone-numberが12桁以上では登録できない' do
        @order_purchase.phone_number = '031234567890'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberは半角数値のみでないと登録できない' do
        @order_purchase.phone_number = '03-1234-567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid.')
      end
    end
  end
end
