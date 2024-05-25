require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    order = FactoryBot.create(:order, user_id: user.id, item_id: item.id)
    @purchase = FactoryBot.build(:purchase, order_id: order.id)
  end

  describe '購入情報入力' do
    context '購入できる場合' do
      it 'postal_code, prefecture, city, house_number, building_name, phone_numberが存在すれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal_code can't be blank")
      end
      it 'postal_codeが正しい記載でないと登録できない' do
        @purchase.postal_code = '8765432'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('is invalid. Include hyphen(-)')
      end
      it 'prefectureが空では登録できない' do
        @purchase.prefecture_id = '1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'phone_numberが9桁以下では登録できない' do
        @purchase.phone_number = '080123456'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone_number is too short (minimum is 10 digits)')
      end
      it 'phone-numberが12桁以上では登録できない' do
        @purchase.phone_number = '031234567890'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone_number is too long (maximum is 11 digits)')
      end
      it 'phone_numberは半角数値のみでないと登録できない' do
        @purchase.phone_number = '03-1234-567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone_number is invalid')
      end
    end
  end
end
