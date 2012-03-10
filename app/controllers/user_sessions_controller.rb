class UserSessionsController < ApplicationController
  before_filter :require_user, :except => [:new, :create]

  def new
    @user_session = UserSession.new
    render :layout => false
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to policy_holders_url
    else
      render :action => :new, :layout => false
     end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_sessions_url
  end

  def show
    redirect_to new_user_sessions_url
  end

end
