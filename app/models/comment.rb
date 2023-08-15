class Comment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user, optional: true
  belongs_to :post
end
