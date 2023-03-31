class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:succes] = 'Micropost created!'
      redirect_to current_user
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to user_path
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end