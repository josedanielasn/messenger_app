class ChatroomusersController < ApplicationController
  def delete
    @remove_user = ChatroomUser.find_by(user_id: params[:user_id], chatroom_id: params[:chatroom_id])
    @remove_user.delete
    redirect_to show_chatroom_path(params[:chatroom_id])
  end
end
