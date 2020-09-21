class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_room = Chatroom.first
    @messages = @current_room.messages
    @new_message = Message.new
    @chatrooms = current_user.chatrooms

  end

  def show
    # byebug
     @current_room = Chatroom.find(params[:id])
     @messages = @current_room.messages
     @new_message = Message.new
     @chatrooms = current_user.chatrooms
     render 'index'
  end

  def new
    @new_chatroom = Chatroom.new
    @users = User.all
    @choose_user = @users.select {|x| x.id != current_user.id}
  end

  def create
    @new_chatroom = Chatroom.new(chatrooms_params)
    @new_chatroom.user_ids << current_user.id
    @new_chatroom.user_ids.map! {|x| x.to_i }
    @new_chatroom.save
    redirect_to chatroom_show_path(@new_chatroom)
  end

  private
  def chatrooms_params
    params.require(:chatroom).permit(:room_name, user_ids:[])
  end

end
