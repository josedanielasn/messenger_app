class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = Message.all
    @new_message = Message.new
  end
end
