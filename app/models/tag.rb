class Tag < ApplicationRecord
  # validations
  validates :tag, presence: true
  validates :tag, format: { with: /\A[a-zA-Z]+\z/,
                            message: 'only allows letters' }
  validates :tag, length: { in: 1..20 }

  # associations
  has_many :recipes_tags, dependent: :delete_all
  has_many :recipes, through: :recipes_tags
end
