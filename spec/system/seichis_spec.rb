require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "聖地投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @seichi_title = Faker::Lorem.sentence
    @seichi_introduction = Faker::Lorem.sentence
    @seichi_addresses = Faker::Lorem.sentence
    @seichi_image_path = Rails.root.join('app/assets/images/travel_people_seichi_junrei.png')  
  end
  context '聖地が投稿できるとき' do
    it 'ログインしたユーザーは新規投稿ができる' do
      basic_pass root_path
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(page).to have_current_path(root_path)
      # 聖地投稿ページへのボタンがあることを確認する
      expect(page).to have_content('聖地を投稿する')
      # 聖地投稿ページに移動する
      visit new_seichi_path
      # GoogleMapをクリックして地点をおとす
      find('div[id="mapragistration"]').click
      # フォームに情報を入力する
      fill_in 'seichi_title', with: @seichi_title
      fill_in 'seichi_introduction', with: @seichi_introduction
      select '漫画', from: 'seichi_category_id'
      select '青森県', from: 'seichi_prefecture_id'
      fill_in 'seichi_addresses', with: @seichi_addresses
      attach_file('seichi-image', @seichi_image_path)
      # 送信するとSeichiモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change{ Seichi.count }.by(1)
      # トップページには先ほど投稿した内容の聖地が存在することを確認する（画像）
      expect(page).to have_selector ".seichi-img[src*='travel_people_seichi_junrei.png']"
      # トップページには先ほど投稿した内容の聖地が存在することを確認する（テキスト）
      expect(page).to have_content(@seichi_title)
      expect(page).to have_content("青森県")
    end
  end

  context '聖地が投稿できないとき' do
    it 'ログインしていないと聖地投稿ページに移動できない' do
      basic_pass root_path
      # トップページに移動する
      visit root_path
      # 聖地投稿ページへのボタンをクリックする
      find('a[id="seichinewbot"]').click
      # ログインページであることを確認する
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end

RSpec.describe "聖地編集", type: :system do
  before do
    @seichi1 = FactoryBot.create(:seichi)
    @seichi2 = FactoryBot.create(:seichi)
  end

  context '聖地編集ができるとき' do
    it 'ログインしたユーザーは自分で投稿した聖地の編集ができる' do
      # 聖地1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in ''
      # 聖地1の詳細ページに編集ページへ移動するボタンがあることを確認する
      # 編集ページへ移動する
      # すでに投稿済みの内容がフォーム（地図及び写真以外）に入っていることを確認する
      # 投稿内容を編集する
      # 投稿してもSeichiモデルのカウントは変わらないことを確認する
      # トップページには先ほど編集した内容の聖地が存在することを確認する（画像）
      # トップページには先ほど編集した内容の聖地が存在することを確認する（テキスト）
    end
  end
  context '聖地編集ができないとき' do
  end
  
end
