class UsersController < ApplicationController
  def new
    @user = User.new;
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Traite un succès d'enregistrement.
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:nom, :email, :password, :salt, :encrypted_password)
    end
end
