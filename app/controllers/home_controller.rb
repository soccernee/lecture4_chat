class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
    @message = @room.messages.build
  end
end
