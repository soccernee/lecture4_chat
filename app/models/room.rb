class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :messages
end
