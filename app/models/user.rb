# frozen_string_literal: true

class User < ApplicationRecord
  # callbacks
  has_secure_password
  after_save :create_favourites
  after_save :create_following

  # validations
  validates :email, presence: true
  validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/,
                              message: 'Invalid email format' }
  validates :email, uniqueness: true

  validates :username, presence: true
  validates :username, length: { in: 1..20 }
  validates :username, uniqueness: true

  validates :password, presence: true

  # associations
  has_many :recipes, dependent: :delete_all
  has_many :posts, dependent: :delete_all

  has_one :favourite, dependent: :destroy
  has_one :following, dependent: :destroy

  # private methods
  private

  def create_favourites
    Favourite.create(user_id: id)
  end

  def create_following
    Following.create(user_id: id)
  end
end
