class Seichi < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :prefecture_id, presence: true
  validates :addresses, presence: true
end
