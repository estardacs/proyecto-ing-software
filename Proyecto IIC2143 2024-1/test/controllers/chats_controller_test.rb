require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @chat = chats(:one)
  end

  test "should show chat" do
    get chat_url(@chat)
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post chat_messages_url(@chat), params: { message: { content: "Hello!" } }
    end

    assert_redirected_to chat_url(@chat)
  end

  test "should get index" do
    get chats_url
    assert_response :success
    assert_not_nil assigns(:posts)
    assert_not_nil assigns(:trips)
    assert_not_nil assigns(:chats)
  end

end
