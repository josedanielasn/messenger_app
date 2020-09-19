class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @messages = current_user.messages.new(messages_params)
    if @messages.save
      ActionCable.server.broadcast "chatroom_channel",
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
