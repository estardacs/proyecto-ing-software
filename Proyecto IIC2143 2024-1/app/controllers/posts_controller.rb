class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.posts
  end
  
  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      puts "Post guardado exitosamente"
      @chat = Chat.new(post: @post)
      if @chat.save
        Notification.create(user: current_user, 
                            message: "Has ofrecido un viaje el día #{@post.fecha} a las #{@post.hora} desde #{@post.campus}")
        redirect_to posts_path, notice: 'Post creado exitosamente.'
      else
        puts @chat.errors.full_messages
      end
    else
      puts "Error al guardar el post"
      puts @post.errors.full_messages
      render :new
      end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post actualizado exitosamente.'
    else
      render :edit
    end
  end

  def subscribe
    @post = Post.find(params[:id])
    @chat = @post.chat
    if current_user == @post.user
      redirect_to buscar_posts_path, alert: 'No puedes suscribirte a tu propio post.'
    else
      if @post.cupos > 0 && !current_user.trips.exists?(post_id: @post.id)
        @trip = Trip.new(user: current_user, post: @post, chat: @chat)
        if @trip.save
          @post.decrement!(:cupos)
          Notification.create(user: current_user, 
                              message: "Te has suscrito al viaje de #{@post.user.nombre_usuario} para el día #{@post.fecha} a las #{@post.hora}")
          Notification.create(user: @post.user, 
                              message: "#{current_user.nombre_usuario} se ha suscrito a tu viaje el día #{@post.fecha} a las #{@post.hora}")
          redirect_to buscar_posts_path, notice: 'Te has suscrito al post exitosamente.'
        else
          redirect_to buscar_posts_path, alert: 'Hubo un error.'
        end
      else
        redirect_to buscar_posts_path, alert: 'No puedes suscribirte a este post.'
      end
    end
  end

  def unsubscribe
    @post = Post.find(params[:id])
    @trip = @post.trips.find_by(user: current_user)
    
    if @trip.present?
      @trip.destroy
      @post.increment!(:cupos)
      redirect_to buscar_posts_path, notice: 'Te has desuscrito del post exitosamente.'
    else
      redirect_to buscar_posts_path, alert: 'No estás suscrito a este post.'
    end
  end
  def destroy
    @post = Post.find(params[:id])

    @chat = @post.chat
    @trip = @post.trips
    @message = @chat.messages

    @message.destroy
    @chat.destroy
    @trip.destroy
    @post.delete
    redirect_to posts_path, notice: 'El post ha sido eliminado exitosamente.'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:id_publicacion, :vigente, :pref_genero, :fecha, :hora, :cupos, :campus,
                                 :auto, :salida, :llegada, :comuna, :salida_lat, :salida_lng, :llegada_lat, :llegada_lng)
  end
end