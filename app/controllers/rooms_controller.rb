class RoomsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      if @room.messages.present?
        session[:username] = @room.messages.first.username
      end
      redirect_to room_path(@room)
    else
      flash[:error] = "Error: #{@room.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
    end
  end

  private 

  def room_params
    params.require(:room).permit(:name, messages_attributes: [:username, :body])
  end
end
