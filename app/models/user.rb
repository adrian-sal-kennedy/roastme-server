class User < ApplicationRecord
    has_many :recipes
    has_one :favourite
end
