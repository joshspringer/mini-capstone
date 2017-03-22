class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # ||= tells computer not to repull info every time, just use what it got the first time
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  # helper_method allows you to use this method in the view (without it, only available in controllers)
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end
end
