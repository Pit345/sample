class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.create if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
