require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @post = posts(:one)
    @chat = chats(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post posts_url, params: { post: { id_publicacion: "123456", vigente: true, pref_genero: "M", fecha: "2024-05-21",
                                        salida: "Salida 1", hora: "10:00", cupos: 2, campus: "Campus 1",
                                        auto: true, llegada: "Llegada 1", comuna: "Comuna 1" } }
    end

    assert_redirected_to posts_url
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    post = posts(:one)
    patch post_url(post), 
          params: { post: { fecha: Date.today, hora: Time.now, cupos: 5, campus: "Campus", auto: true, llegada: "Llegada", 
comuna: "Comuna", salida_lat: 1.0, salida_lng: 1.0, llegada_lat: 2.0, llegada_lng: 2.0 } }
    assert_redirected_to posts_url
    assert_equal 'Post actualizado exitosamente.', flash[:notice]
  end

  test "should unsubscribe from post" do
    @trip = trips(:one)
    @post.update(cupos: 2)

    assert_difference('Trip.count', -1) do
      delete unsubscribe_post_url(@post)
    end

    assert_redirected_to buscar_posts_url
  end

  test "should destroy post" do
    post = posts(:one)
    assert_difference('Post.count', -1) do
      delete post_url(post)
    end

    assert_redirected_to posts_url
    assert_equal 'El post ha sido eliminado exitosamente.', flash[:notice]
  end

  test "should show post" do
    post = posts(:one)  # Asegúrate de tener un fixture para un post
    get post_path(post)
    assert_response :success
    assert_not_nil assigns(:post)
  end
end
