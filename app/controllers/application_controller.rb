class ApplicationController < ActionController::Base  
  helper_method :current_user, :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to welcome_page_path, notice: exception.message
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
 
  def logged_in?
    !!current_user
  end

  def requirere_user
    if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to welcome_page_path
    end
  end
end
