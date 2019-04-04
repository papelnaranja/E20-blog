class PagesController < ApplicationController
    skip_authorization_check :only => [:dashboard]
  
    
  def dashboard
    @users = User.all
  end
end
