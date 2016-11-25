class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in_user
    unless helpers.logged_in?
      flash[:warning] = '请先登录'
      redirect_to root_path
    end
  end
end
