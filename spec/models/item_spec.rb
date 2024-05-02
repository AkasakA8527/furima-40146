require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '新規入力できる場合' do
      it 'image, item_name, description, category_id, condition_id, whopay_id, prefecture_id, shipday_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規入力できない場合' do

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担の情報が空では登録できない' do
        @item.whopay_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Whopay can't be blank")
      end
      it '発送元の地域の情報が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数の情報が空では登録できない' do
        @item.shipday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipday can't be blank")
      end
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと登録できない' do
        @item.price = Faker::Number.within(range: 0..299)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が999万9999円超だと登録できない' do
        @item.price = Faker::Number.within(range: 10000000..20000000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数値でないと登録できない' do
        @item.price = "１５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end