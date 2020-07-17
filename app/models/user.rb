class User < ApplicationRecord
    has_many :recipes
    has_one :favourite
    has_many :posts
end
