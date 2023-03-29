class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:succes] = 'Micropost created!'
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end