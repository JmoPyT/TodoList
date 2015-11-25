##
# Controller pour les utilisateurs
class UsersController < ApplicationController
  ##
  # Page pour la création d'un nouvel utilisateur
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, flash: { notice: t('notice.delete_user') }
    else
      redirect_to root_path, flash: { alert: t('alert.delete_user') }
    end
  end

  private

  def user_params
    params.require(:user).permit(:nom, :email, :slug)
  end
end
