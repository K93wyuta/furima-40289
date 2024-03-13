require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id )
    buyer = FactoryBot.create(:user)
    @order = FactoryBot.build(:order,buyer_id: buyer.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品購入ができる場合' do
      it 'すべての項目が存在していれば購入できる' do
        expect(@order).to be_valid
      end
      it 'buildingが存在しなくても購入できる' do
        @order.building = ""
        expect(@order).to be_valid
      end
    end
    context '商品購入ができない場合' do
      it 'postcodeが空では購入できない' do
        @order.postcode = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.postcode = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode is invalid")
      end
      it 'prefecture_idが空では購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では購入できない' do
        @order.block = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが10桁未満の場合は購入できない' do
        @order.phone_number = "123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁を超過の場合は購入できない' do
        @order.phone_number = "123456789012"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数値以外の文字が含まれる場合は購入できない' do
        @order.phone_number = "123456789a"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'buyer_idと紐づいていなければ購入できない' do
        @order.buyer_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Buyer can't be blank")
      end
      it 'item_idと紐づいていなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
