class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @messages = current_user.messages.new(messages_params)
    if @messages.save
      redirect_to users_messages_path
    else
      flash.now[:alert] = 'Error while sending message!'
    end
  end

  private
  def messages_params
    params.require(:message).permit(:message_body, :user_id)
  end
end
