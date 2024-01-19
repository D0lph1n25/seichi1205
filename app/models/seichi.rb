class Seichi < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :addresses, presence: true
  validates :image, presence: true

  def self.ransackable_attributes(auth_oject = nil)
    ["title", "introduction", "category_id", "prefecture_id"]
  end

end
