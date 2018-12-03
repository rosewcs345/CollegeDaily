class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_current_user
  
  private

  def set_current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	redirect_to welcome_login_page_path and return unless @current_user
  end
  
  helper_method :set_current_user        
      
end
