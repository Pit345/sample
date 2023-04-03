class SessionsController < ApplicationController
  def new;end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to user
    else
      render :new
    end
  end
end
