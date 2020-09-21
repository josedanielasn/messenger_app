class AddRoomAdminToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :room_admin, :string
  end
end
