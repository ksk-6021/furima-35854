require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'ニックネームがない場合登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスがない場合登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したメールアドレスがある場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@がない場合登録できない' do
      @user.email = 'aaaaaa.com'
      @user.valid?
    end
    it 'パスワードがない場合登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、5文字以下だと登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力でないと登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'パスワードとパスワード（確認）は、値が一致しないと登録できない' do
      @user.password = '111aaa'
      @user.password_confirmation = '111bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
