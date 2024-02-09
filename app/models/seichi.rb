class Seichi < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :introduction, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :addresses, presence: true
  validates :image, presence: true
  validates :latitude,  numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90, message: "地図で地点を選択してください" }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180, message: "地図で地点を選択してください" }

  def self.ransackable_attributes(auth_oject = nil)
    ["title", "introduction", "category_id", "prefecture_id"]
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
