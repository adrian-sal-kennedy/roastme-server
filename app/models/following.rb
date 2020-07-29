# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :user
  has_many :followings_users, dependent: :delete_all
  has_many :users, through: :followings_users
end
