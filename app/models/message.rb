class Message < ApplicationRecord
  belongs_to :room

  validates :username, presence: true
  validates :body, presence: true
end
