require 'rails_helper'
RSpec.describe UserOrder, type: :model do
  
    before do
      @user_order = FactoryBot.build(:user_order)
    end
  context '商品の購入に失敗するとき' do
    it '郵便番号を入力しないと購入できない' do
      @user_order.post_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
    end
    it '都道府県を選択しないと購入できない' do
      @user_order.ship_form_id = 1
      @user_order.valid?
      expect(@user_order.errors[:ship_form_id]).to include("must be other than 1")
    end
    it '都道府県を入力しないと購入できない' do
      @user_order.ship_form_id = nil
      @user_order.valid?
      expect(@user_order.errors[:ship_form_id]).to include("is not a number", "can't be blank")
    end
    it '番地を入力しないと購入できない' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end
    it '市区町村を入力しないと購入できない' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it '電話番号を入力しないと購入できない' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
    end
    it '電話番号を11桁以内で入力しないと購入できない' do
      @user_order.phone_number = "12333456789098"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号はハイフン不要で入力しないと購入できない' do
      @user_order.phone_number = '098-9876-998---76'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
    it '郵便番号はハイフンを含んで入力しないと購入できない' do
      @user_order.post_code = '0987654'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post code is invalid")
    end
    it 'tokenが空では登録できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと購入できない' do
      @user_order.user_id = nil
      @user_order.valid?
      expect(@user_order.errors[:user_id]).to include("can't be blank")
    end
    it 'item_idが空だと購入できない' do
      @user_order.item_id = nil
      @user_order.valid?
      expect(@user_order.errors[:item_id]).to include("can't be blank")
    end
  end
    context '商品の購入に成功するとき' do
      it '全ての情報があるとき' do
        expect(@user_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end
end
