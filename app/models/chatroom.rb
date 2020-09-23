class Chatroom < ApplicationRecord
  has_many :messages, dependent: :delete_all
  has_many :chatroom_users, dependent: :delete_all
  has_many :users, through: :chatroom_users
  validates :room_name, presence: true, uniqueness: true
  scope :general_channel, ->(name = "General Channel") { where("room_name = ?", name) }
end 
