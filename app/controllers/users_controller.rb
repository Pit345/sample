class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @micropost_form = current_user.microposts.build
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "#{@user.name}, welcome to the Sample App!"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
319