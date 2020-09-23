class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @messages = current_user.messages.new(messages_params)
    @messages.chatroom_id = params[:id]
    # byebug
    if @messages.save
      ActionCable.server.broadcast "chatroom_channel_#{@messages.chatroom_id}",
      {mod_messages: message_render(@messages), sent_by: current_user}
    else
      flash.now[:alert] = 'Error while sending message!'
    end
  end

  def create_in_general_channel
    @messages = current_user.messages.new(messages_params)
    @messages.chatroom_id = Chatroom.general_channel[0].id 
    # byebug
    if @messages.save
      ActionCable.server.broadcast "chatroom_channel_#{@messages.chatroom_id}",
      {mod_messages: message_render(@messages), sent_by: current_user}
    else
      flash.now[:alert] = 'Error while sending message!'
    end
  end

  private
  def messages_params
    params.require(:message).permit(:message_body, :user_id)
  end
 
  def message_render(message)
    render(partial: 'message', locals:{message: message})
  end
end
