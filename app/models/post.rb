class Post < ApplicationRecord
  # validations
  validates :post, presence: true

  # associations
  belongs_to :user
  belongs_to :recipe
end
