require 'rails_helper'

RSpec.describe Seichi, type: :model do
  before do
    @seichi = FactoryBot.build(:seichi)
  end

  describe '聖地の投稿' do

    context '聖地が投稿できるとき' do
      it '作品名、場所の紹介、都道府県以下の住所が入力、地図で地点クリック、カテゴリー及び都道府県の選択及び写真が選択されているとき' do
        expect(@seichi).to be_valid
      end
    end

    context '聖地が投稿できないとき' do
      it '作品名が空では投稿できない' do
        @seichi.title = ""
        @seichi.valid?
        expect(@seichi.errors.full_messages).to include("作品名を入力してください")
      end
      it '場所の紹介が空では投稿できない' do
      end
      it 'カテゴリーが「---」を選択されている（category_idが1）と投稿できない' do
      end
      it '都道府県が「---」を選択されている（prefecture_idが1）と投稿できない' do
      end
      it '都道府県以下の住所が空では投稿できない' do
      end
      it '地図で地点をクリックされていないと投稿できない(latitudeが空)' do
      end
      it '地図で地点をクリックされていないと投稿できない(longitudeが空)' do
      end
      it '地図で地点をクリックされていないと投稿できない(latitude及びlongitudeが空)' do
      end
      it '写真が選択されていないと投稿できない' do
      end
    end
  end

end
