class MessagesController < ApplicationController

  def index
    set_room
    @messages = @room.messages

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @messages.to_json}
    end
  end

  def create
    set_room
    @message = @room.messages.build(message_params)
    if @message.save
      redirect_to @room
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_to @room
    end
  end

  private 


  def set_room
    @room = Room.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:username, :body)
  end
end
