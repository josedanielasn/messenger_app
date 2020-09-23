class ChatroomsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @general_channel = Chatroom.general_channel[0]
    if !@general_channel.users.include?(current_user)
      @general_channel.users << current_user
    end
    @current_room =  @general_channel
    @messages = @current_room.messages
    @new_message = Message.new               
    @chatrooms = current_user.chatrooms

  end

  def show
    # byebug
     @general_channel = Chatroom.general_channel[0]
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
    @new_chatroom.user_ids.map! {|x| x.to_i }
    @new_chatroom.room_admin = current_user.username
    @new_chatroom.save
    @new_chatroom.users << current_user
    redirect_to show_chatroom_path(@new_chatroom)
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
    @choose_user = User.all.select {|user| user.username != @chatroom.room_admin}
  end

  def  update
    @chatroom = Chatroom.find(params[:id])

    if @chatroom.update(params.require(:chatroom).permit(:room_name,:room_admin ,user_ids: []))
      redirect_to show_chatroom_path(@chatroom)
    else
      render 'edit'
    end
  end

  def delete 
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to root_path
  end

  private
  def chatrooms_params
    params.require(:chatroom).permit(:room_name, user_ids:[])
  end

end
