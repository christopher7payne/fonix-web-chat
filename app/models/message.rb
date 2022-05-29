class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :content, message: "can't be blank"

  after_create_commit { broadcast_append_to self.room }
end
