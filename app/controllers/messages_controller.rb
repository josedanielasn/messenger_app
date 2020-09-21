class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @messages = current_user.messages.new(messages_params)
    @messages.chatroom_id = params[:id]
    # byebug
    if @messages.save
      html = message_render(@messages)
      ActionCable.server.broadcast "chatroom_channel_#{@messages.chatroom_id}",
      # {partial: message_render(@messages), sent_by: current_user}
      html: html
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
