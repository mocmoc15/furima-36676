require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_kana_first_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailに＠がないと登録できない" do
        @user.email = "kkkaaattt"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user,email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = 'a00b0'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが半角英字だけでは登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it "passwordが半角数字だけでは登録できない" do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password = "a123456"
        @user.password_confirmation = "a1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）入力でないと登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）入力でないと登録できない" do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "last_name_kanaが全角（カタカナ）入力でないと登録できない" do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters"
      end
      it "first_name_kanaが全角（カタカナ）入力でないと登録できない" do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters"
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end

