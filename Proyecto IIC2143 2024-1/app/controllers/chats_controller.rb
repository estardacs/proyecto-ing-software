class ChatsController < ApplicationController

  def show
    @chat = Chat.find(params[:id])
  end

  def index
    @posts = current_user.posts
    @trips = current_user.trips
    @chats = (@posts.map(&:chat) + @trips.map(&:chat)).uniq
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user
  
    if @message.save
      redirect_to chat_path(@chat), notice: 'Mensaje enviado exitosamente.'
    else
      render :show
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content)
  end
end
