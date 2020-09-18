class Message < ApplicationRecord
  belongs_to :user
  validates :message_body, presence: true, length: {maximum:3000}
end
