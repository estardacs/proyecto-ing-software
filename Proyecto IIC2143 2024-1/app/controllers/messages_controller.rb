class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user

    if @message.save
      @post = @chat.post
      @post.trips.where.not(user_id: current_user.id).each do |trip|
        Notification.create(
          user: trip.user,
          message: "Tienes nuevos mensajes sin leer en el chat #{@chat.id}"
        )
      end
      redirect_to chat_path(@chat), notice: 'Mensaje enviado exitosamente.'
    else
      render 'chats/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end