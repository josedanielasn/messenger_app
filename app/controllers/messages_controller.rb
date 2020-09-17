class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @messages = Message.new(messages_params)
    @messages.user_id = params[:user_id]
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
