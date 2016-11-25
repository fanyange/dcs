class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      helpers.log_in user
      params[:session][:remember_me] == '1' ? helpers.remember(user) : helpers.forget(user)
      flash[:success] = '已登录'
      redirect_to documents_path
    else
      flash.now[:danger] = '用户名或密码错误'
      render :new
    end
  end

  def destroy
    helpers.log_out if helpers.logged_in?
    flash[:success] = '已退出登录'
    redirect_to root_path
  end
end
