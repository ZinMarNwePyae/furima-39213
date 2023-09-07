require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'building_noが空でも保存できない' do
        @order_form.building = '122'
        expect(@order_form).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できない' do
        @order_form.postcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it 'postcode半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.block = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに全角文字が入っていると保存できない' do
        @order_form.phone_number = '000 15455 01'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数字10桁未満だと保存できない' do
        @order_form.phone_number = 123_456_789
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角数字12桁以上だと保存できない' do
        @order_form.phone_number = 12 - 3456 - 456 - 123 - 1255
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
