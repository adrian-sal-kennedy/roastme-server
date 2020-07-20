class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true

    has_many :recipes
    has_one :favourite
    has_many :posts

    has_many :following
    has_many :users, through: :following
end
