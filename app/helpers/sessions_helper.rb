module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in_user
    if !logged_in?
      flash[:danger] = "Please log in."
      redirect_to root_path
    end
  end
end
