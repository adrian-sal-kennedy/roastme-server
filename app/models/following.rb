class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following
end
