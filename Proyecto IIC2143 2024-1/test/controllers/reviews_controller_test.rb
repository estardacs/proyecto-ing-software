require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_review_url
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post reviews_url, 
           params: { review: { comentario: "Great job!", rating: 5, reviewed_user_nombre_usuario: "testuser2" } }
    end

    assert_redirected_to reviews_url
    assert_equal 'Reseña realizada con éxito.', flash[:notice]
  end

  test "should not create review if reviewed user does not exist" do
    assert_no_difference('Review.count') do
      post reviews_url, 
           params: { review: { comentario: "Great job!", rating: 5, reviewed_user_nombre_usuario: "nonexistentuser" } }
    end

    assert_redirected_to new_review_url
    assert_equal 'El usuario no existe.', flash[:alert]
  end

  test "should not create review if reviewing oneself" do
    assert_no_difference('Review.count') do
      post reviews_url, 
           params: { review: { comentario: "Great job!", rating: 5, reviewed_user_nombre_usuario: "testuser1" } }
    end

    assert_redirected_to new_review_url
    assert_equal 'No puedes hacer una review de ti mismo.', flash[:alert]
  end

end
