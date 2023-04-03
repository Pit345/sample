class MicropostsController < ApplicationController

  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost create!'
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
