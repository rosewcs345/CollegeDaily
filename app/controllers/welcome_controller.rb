class WelcomeController < ApplicationController
  skip_before_filter :set_current_user, :only => [:login_page]
      
  def login_page
    @controller = 'welcome'
    @action = 'login_page'
      
  end
end
