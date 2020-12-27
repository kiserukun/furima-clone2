require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  context '出品できない場合' do
    it '商品画像を１枚つけないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors[:category_id]).to include('must be other than 1')
    end
    it '商品の状態についての情報がないと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors[:status_id]).to include('must be other than 1')
    end
    it '配送料の負担についての情報がないと出品できない' do
      @item.fee_id = 1
      @item.valid?
      expect(@item.errors[:fee_id]).to include('must be other than 1')
    end
    it '発送元の地域についての情報がないと出品できない' do
      @item.ship_form_id = 1
      @item.valid?
      expect(@item.errors[:ship_form_id]).to include('must be other than 1')
    end
    it '発送までの日数についての情報がないと出品できない' do
      @item.day_to_ship_id = 1
      @item.valid?
      expect(@item.errors[:day_to_ship_id]).to include('must be other than 1')
    end
    it '価格についての情報がないと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が299だと出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than 299')
    end
    it '価格が10000000だと出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end
    it '販売価格は半角数字のみでないと出品できない' do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end

  context '出品に成功するとき' do
    it '商品画像が一枚あれば出品できる' do
      expect(@item).to be_valid
    end
    it '商品名あれば出品できる' do
      @item.name = 'あああ'
      expect(@item).to be_valid
    end
    it '商品説明があれば出品できる' do
      @item.description = 'あああ'
      expect(@item).to be_valid
    end
    it '商品カテゴリーが選択されていれば出品できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it '商品の状態が選択されていれば出品できる' do
      @item.status_id = 2
      expect(@item).to be_valid
    end
    it '発送料の負担選択されていれば出品できる' do
      @item.fee_id = 2
      expect(@item).to be_valid
    end
    it '発送までの日数が選択されていれば出品できる' do
      @item.day_to_ship_id = 2
      expect(@item).to be_valid
    end
    it '発送元の地域が選択されていれば出品できる' do
      @item.ship_form_id = 2
      expect(@item).to be_valid
    end
    it '価格が入力されていれば出品できる' do
      @item.price = '1000'
      expect(@item).to be_valid
    end
    it '最低価格は300から出品できる' do
      @item.day_to_ship_id = '300'
      expect(@item).to be_valid
    end
    it '最高価格は9999999まで出品できる' do
      @item.ship_form_id = '9999999'
      expect(@item).to be_valid
    end
    it '販売価格は半角数字のみで出品できる' do
      @item.price = '1000'
      expect(@item).to be_valid
    end
  end
end
