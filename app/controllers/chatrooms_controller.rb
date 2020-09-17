class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages.all
    @new_message = @user.messages.build
  end
end
