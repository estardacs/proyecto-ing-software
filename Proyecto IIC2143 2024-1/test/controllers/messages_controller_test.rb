require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @chat = chats(:one)
    sign_in @user
  end

  test "should create message" do
    assert_difference('Message.count') do
      post chat_messages_url(@chat), params: { message: { content: "Hello!" } }
    end

    assert_redirected_to chat_url(@chat)
    assert_equal 'Mensaje enviado exitosamente.', flash[:notice]
  end
end
