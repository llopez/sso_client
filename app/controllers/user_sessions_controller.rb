class UserSessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    logger.debug "+++ #{omniauth}"

    user = User.find_by_uid(omniauth['uid'])
    if not user
      # New user registration
      user = User.new(:uid => omniauth['uid'])
    end    
    user.name = omniauth['extra']['name']
    user.gender = omniauth['extra']['gender']
    user.age = omniauth['extra']['age']
    user.save

    session[:user_id] = omniauth

    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{CUSTOM_PROVIDER_URL}/users/sign_out"
  end
end
