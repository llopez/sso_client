class ApplicationController < ActionController::Base
  def login_required
    return true if current_user
    respond_to do |format|
      format.html do
        redirect_to '/auth/sso'
      end
      format.json do
        render json: { error: 'Access Denied' }
      end
    end
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find_by_uid(session[:user_id]['uid'])
  end
end
