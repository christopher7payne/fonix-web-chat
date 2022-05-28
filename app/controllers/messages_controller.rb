class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.create(content: safe_params[:content], room_id: params[:room_id])
  end

  private

  def safe_params
    params.require(:message).permit(:content)
  end
end
