class ApplicationController < ActionController::Base
  before_filter :require_user
  helper :all
  helper_method :current_user
  protect_from_forgery
  layout "application"

  private
 
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find

  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_sessions_url
      false
    end
  end

end
