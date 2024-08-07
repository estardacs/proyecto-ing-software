class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.where(read: false).order(created_at: :desc)
  end

  def mark_as_read
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    head :ok
  end
end