require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "Seichis", type: :system do
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

end
