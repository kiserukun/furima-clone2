require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  context '登録に成功したとき' do
    it 'passwordは６文字以上ないと登録できない' do
      @user.password = '00e000'
      @user.password_confirmation = '00e000'
      expect(@user).to be_valid
    end
  end
  context '登録に失敗したとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '他のuserのemailとかぶると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken', 'Email has already been taken')
    end
    it 'emailに＠ついてないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは半角英字で入力しないと登録できない' do
      @user.password = 'ａbｃ'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)', 'is invalid')
    end
    it 'passwordは半角数字で入力しないと登録できない' do
      @user.password = '１２３'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)', 'is invalid')
    end
    it 'passwordは半角英字のみだと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
    it 'passwordは半角数字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end
    it 'passwordがpassword(確認用)の値が一致しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字を入力しないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '名前を入力しないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:first_name]).to include('is invalid')
    end
    it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:last_name]).to include('is invalid')
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('is invalid')
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include('is invalid')
    end
    it '名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('is invalid')
    end
    it '名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include('is invalid')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end

    expect(@item).to be_valid
  end
end
