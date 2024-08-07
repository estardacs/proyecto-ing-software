class ReviewsController < ApplicationController
  def index
    if params[:nombre_usuario].present?
      @reviewed_user = User.find_by(nombre_usuario: params[:nombre_usuario])
      if @reviewed_user.present?
        @reviews = @reviewed_user.reviews_received.order(created_at: :desc)
      else
        @reviews = []
      end
    else
      @reviews = current_user.reviews_received.order(created_at: :desc)
    end
  end

  def new
    @review = Review.new
  end

  def create
    @reviewed_user = User.find_by(nombre_usuario: params[:review][:reviewed_user_nombre_usuario])
  
    if @reviewed_user.nil?
      redirect_to new_review_path, alert: 'El usuario no existe.'
    elsif @reviewed_user == current_user
      redirect_to new_review_path, alert: 'No puedes hacer una review de ti mismo.'
    else
      @review = Review.new(review_params)
      @review.reviewer = current_user
      @review.reviewed_user = @reviewed_user
  
      if @review.save
        Notification.create(user: current_user, message: "Has hecho una review a #{@reviewed_user.nombre_usuario}")
        Notification.create(user: @reviewed_user, message: "#{current_user.nombre_usuario} te ha hecho una review")
        redirect_to reviews_path, notice: 'Reseña realizada con éxito.'
      else
        render :new
      end
    end
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path, notice: 'Reseña actualizada correctamente.'
    else
      render :edit
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: 'La review ha sido eliminada exitosamente.'
  end

  private

  def review_params
    params.require(:review).permit(:comentario, :rating)
  end
end