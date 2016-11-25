class StaticPagesController < ApplicationController
  def home
    if helpers.logged_in?
      redirect_to documents_path
    end
  end
end
