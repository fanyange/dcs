class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_current_user, only: [:edit, :destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(setting_params)
      flash[:success] = '设置成功'
      redirect_to action: 'edit'
    else
      render 'edit'
    end
  end

  def update_password
    @user = User.find(params[:id])
    if @user.update(password_params)
      flash[:success] = '设置成功'
      redirect_to action: 'edit'
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      helpers.log_in @user
      helpers.remember(@user)
      redirect_to documents_path
    else
      render 'new'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :group_id, :password, :password_confirmation)
  end

  def setting_params
    params.require(:user).permit(:name, :email, :group_id)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def ensure_current_user
    unless @user == helpers.current_user
      flash['warning'] = '权限不足'
      redirect_to root_url 
    end
  end
end
