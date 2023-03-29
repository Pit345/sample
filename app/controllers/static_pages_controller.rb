class StaticPagesController < ApplicationController
  def home

  end

  def help
    @micropost = current_user.microposts.create
  end

  def about
  end

  def contact
  end
end
