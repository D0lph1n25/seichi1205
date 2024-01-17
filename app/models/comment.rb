class Comment < ApplicationRecord
  belongs_to :seichi
  belongs_to :user
end
