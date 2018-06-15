class UserSessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    user = User.find_or_initialize_by(uid: omniauth['uid'])
    user.name = omniauth['extra']['name']
    user.gender = omniauth['extra']['gender']
    user.age = omniauth['extra']['age']
    user.save
    session[:user_id] = omniauth['uid']

    flash[:notice] = "Successfully logged in"
    redirect_to profile_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have successfully signed out!'
    redirect_to root_path
  end
end
