class Room < ApplicationRecord
  validates_uniqueness_of :name
  has_many :messages

  scope :open_rooms, -> { where(enabled: true) }
  scope :closed_rooms, -> { where(enabled: false) }
end
