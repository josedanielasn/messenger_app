class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  validates :message_body, presence: true, length: {maximum:3000}
end
