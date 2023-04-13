class MicropostsController < ApplicationController

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost create!'
      redirect_to current_user
    else
      render 'users/show'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to current_user
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
end