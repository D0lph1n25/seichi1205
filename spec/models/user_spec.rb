require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it 'nickname,email、password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana及びbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'メールアドレスは、@を含まないと登録できない' do
        @user.email = 'abecedei'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'パスワードとパスワード（確認）が一致していないと登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'b123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'パスワードが6文字以上でないと登録できない' do
        @user.password = '1abde'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'パスワードが全角文字を含むと登録できない' do
        @user.password = 'i51565あＥ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it '名字が空なら登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end

      it '名前が空なら登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end

      it '名字が全角以外であれば登録できない' do
        @user.last_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は不正な値です')
      end

      it '名前が全角以外であれば登録できない' do
        @user.first_name = 'abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は不正な値です')
      end

      it '名字のカナが空では登録できない' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("姓のカナを入力してください")
      end

      it '名前のカナが空では登録できない' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("名のカナを入力してください")
      end

      it '名字のカナが全角（カタカナ）以外では登録できない' do
        @user.last_name_kana = 'あおやま'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓のカナは不正な値です')
      end

      it '名前のカナが全角（カタカナ）以外では登録できない' do
        @user.first_name_kana = 'あおやま'
        @user.valid?
        expect(@user.errors.full_messages).to include('名のカナは不正な値です')
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
