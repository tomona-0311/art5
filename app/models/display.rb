class Display < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post
  has_one_attached :image
end
