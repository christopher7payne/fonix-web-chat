class Room < ApplicationRecord
  validates_uniqueness_of :name

  scope :open_rooms, -> { where(enabled: true) }
  scope :closed_rooms, -> { where(enabled: false) }
end
