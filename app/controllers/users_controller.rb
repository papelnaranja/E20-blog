class UsersController < ApplicationController
    load_and_authorize_resource
    skip_authorization_check :only => [:change_role]
  def change_role
    user = User.find(params[:id])
    if user.role == 'admin'
      user.role = 'visit'
    end
    if user.role == 'visit'
      user.role = 'admin'
    end
    user.save
    redirect_to dashboard_url
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to dashboard_url 
  end
end
