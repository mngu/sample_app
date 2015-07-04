require 'rails_helper'

describe UsersController, type: :controller do

  before(:each) do
    @user = create(:user)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET 'show'" do

    it "devrait réussir" do
      get :show, :id => @user
      expect(response).to have_http_status(:success)
    end

    it "devrait trouver le bon utilisateur" do
      get :show, :id => @user
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "POST 'create'" do

    describe "échec" do

      before(:each) do
        @attr = {
          :nom => "",
          :email => "",
          :password => "",
          :password_confirmation => ""
        }
      end

      it "ne devrait pas créer d'utilisateur" do
        expect(lambda do
          post :create, :user => @attr
        end).not_to change(User, :count)
      end

      it "devrait rendre la page 'new'" do
        post :create, :user => @attr
        expect(response).to render_template('new')
      end
    end

    describe "succès" do

      before(:each) do
        @attr = {
          :nom => "New User",
          :email => "user@example.com",
          :password => "foobar",
          :password_confirmation => "foobar"
        }
      end

      it "devrait créer un utilisateur" do
        expect(lambda do
          post :create, :user => @attr
        end).to change(User, :count).by(1)
      end

      it "devrait rediriger vers la page d'affichage de l'utilisateur" do
        post :create, :user => @attr
        expect(response).to redirect_to(user_path(assigns(:user)))
      end

      it "devrait avoir un message de bienvenue" do
        post :create, :user => @attr
        expect(flash[:success]).to match(/Bienvenue dans l'Application Exemple/i)
      end
    end
  end

end
