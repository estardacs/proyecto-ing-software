require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    # Creamos algunas notificaciones asociadas a current_user
    @notification = Notification.create(user: @user, message: "Notification 1")
    @notification2 = Notification.create(user: @user, message: "Notification 2")
  end

  test "should get index" do
    get notifications_url
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  test "should mark notification as read" do
    post mark_as_read_notification_url(@notification)
    assert_response :success
    @notification.reload
    assert @notification.read  # Verifica que la notificación esté marcada como leída
  end
end
