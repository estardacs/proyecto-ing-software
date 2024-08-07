class PagesController < ApplicationController
  before_action :authenticate_user!

  def perfil
    @user = current_user
    @n_tuc = @user.n_tuc
    @nombre_usuario = @user.nombre_usuario
    @descripcion = @user.descripcion
    @genero = @user.genero
    @rating_promedio = @user.reviews_received.average(:rating).to_f.round(1)
    puts "N_TUC: #{@n_tuc}"
    puts "Nombre de usuario: #{@nombre_usuario}"
    puts "Descripcion: #{@descripcion}"
    puts "Género: #{@genero}"
    puts "Rating promedio: #{@rating_promedio}"
  end

  def edit_perfil
    @user = current_user
  end

  def tarjeta_usuario
    @user = User.find(params[:id])
    @rating_promedio = @user.reviews_received.average(:rating).to_f.round(1)
    @chat_id = params[:chat_id]
  end

  def buscar
    @posts = Post.where('cupos > 0')
  
    if params[:auto].present?
      @posts = @posts.where(auto: params[:auto] == '1')
    end
  
    if params[:comuna].present?
      @posts = @posts.where(comuna: params[:comuna])
    end
  
    if params[:pref_genero].present?
      @posts = @posts.where(pref_genero: params[:pref_genero])
    end
  
    if params[:fecha].present?
      @posts = @posts.where(fecha: params[:fecha])
    end
  
    if params[:campus].present?
      @posts = @posts.where(campus: params[:campus])
    end
  
    if params[:salida].present?
      @posts = @posts.where(salida: params[:salida])
    end
  
    if params[:llegada].present?
      @posts = @posts.where(llegada: params[:llegada])
    end
  
    if params[:tipo_viaje].present?
      case params[:tipo_viaje]
      when 'Creados'
        @posts = @posts.where(user_id: current_user.id)
      when 'Suscritos'
        @posts = @posts.joins(:trips).where(trips: { user_id: current_user.id })
      when 'No Suscritos'
        @posts = @posts.where.not(id: current_user.trips.pluck(:post_id))
      end
    end
  end

  def posts
    redirect_to posts_path
  end
  
  def guia_usuario
    render 'guia_usuario'
  end

  def review
    redirect_to reviews_path
  end

  def update_perfil
    @user = current_user
    if @user.update_with_password(user_params)
      if params[:user][:image].present?
        @user.image.purge if @user.image.attached?
        @user.image.attach(params[:user][:image])
      end
      Notification.create(user: current_user, message: 'Cambiaste tu contraseña exitosamente')
      bypass_sign_in(@user)
      redirect_to pages_perfil_path, notice: 'Perfil actualizado correctamente.'
    else
      render :edit_perfil
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nombre_usuario, :descripcion, :current_password, :password, :password_confirmation, 
                                 :genero)
  end
end