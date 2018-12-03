class SessionsController < ApplicationController
  skip_before_filter :set_current_user

  # **********************************
  #delete sessions folder in view  
  def create
    @user = User.where(:provider => auth_hash["provider"], :uid => auth_hash["uid"]).first || User.create_with_omniauth(auth_hash)
    session[:user_id] = @user.id
    flash[:notice] = 'Login successful'
    redirect_to events_path(@user.id)
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully'
    redirect_to welcome_login_page_path
  end
  
  private
  def auth_hash
    ActionController::Parameters.new(request.env["omniauth.auth"])
  end
end
      