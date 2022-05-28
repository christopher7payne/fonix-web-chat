class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :page_setup

  def index
    @rooms = Room.open_rooms
  end

  def show
    @room = Room.find_by(id: safe_params[:room_id])
    redirect_to all_rooms_path, alert: 'Unable to find room' unless @room
    @message = Message.new
  end

  private

  # Override the set page layout in the application.html
  def page_setup
    @page_width = 500
  end

  def safe_params
    params.permit(:room_id)
  end
end
