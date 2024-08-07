require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #perfil" do
    it "returns a success response" do
      get :perfil
      expect(response).to be_successful
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit_perfil" do
    it "returns a success response" do
      get :edit_perfil
      expect(response).to be_successful
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #buscar" do
    it "returns a success response" do
      get :buscar
      expect(response).to be_successful
      expect(assigns(:posts)).to_not be_nil
    end

    it "filters posts based on parameters" do
      post1 = create(:post, cupos: 2, auto: true)
      post2 = create(:post, cupos: 0)

      get :buscar, params: { auto: '1' }
      expect(assigns(:posts)).to include(post1)
      expect(assigns(:posts)).to_not include(post2)
    end
  end

  describe "GET #posts" do
    it "redirects to posts path" do
      get :posts
      expect(response).to redirect_to(posts_path)
    end
  end

  describe "GET #review" do
    it "redirects to reviews path" do
      get :review
      expect(response).to redirect_to(reviews_path)
    end
  end

  describe "PATCH #update_perfil" do
    it "updates the user profile" do
      patch :update_perfil, params: { user: { nombre_usuario: 'newname' } }
      user.reload
      expect(user.nombre_usuario).to eq('newname')
      expect(response).to redirect_to(pages_perfil_path)
      expect(flash[:notice]).to eq('Perfil actualizado correctamente.')
    end

    it "renders edit_perfil on failure" do
      patch :update_perfil, params: { user: { nombre_usuario: '' } }
      expect(response).to render_template(:edit_perfil)
    end
  end
end
