require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should get perfil" do
    get pages_perfil_url
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should get edit_perfil" do
    get edit_perfil_url
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should get buscar" do
    get buscar_posts_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should filter posts based on parameters" do
    post1 = posts(:one)
    post2 = posts(:two)

    get buscar_posts_url, params: { auto: '1' }
    assert_response :success
    assert_includes assigns(:posts), post1
    assert_not_includes assigns(:posts), post2
  end

  test "should redirect to posts path" do
    get pages_posts_url
    assert_redirected_to posts_path
  end

  test "should redirect to reviews path" do
    get pages_review_url
    assert_redirected_to reviews_path
  end

  test "should render edit_perfil on failure" do
    patch update_perfil_url, params: { user: { nombre_usuario: '' } }
    assert_template :edit_perfil
  end
end
