class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments
  belongs_to :user, optional: true
end

