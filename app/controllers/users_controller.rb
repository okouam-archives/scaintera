class UsersController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 4
  end

  def page
    params[:page] || 1
  end

  def index
    @users = User.paginate(per_page: per_page, page: page)
  end

end