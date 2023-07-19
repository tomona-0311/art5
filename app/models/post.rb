class Post < ApplicationRecord
  has_one_attached :image
  has_many :displays
  belongs_to :user, optional: true
end

