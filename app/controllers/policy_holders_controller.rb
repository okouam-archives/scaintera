class PolicyHoldersController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 4
  end

  def page
    params[:page] || 1
  end

  def index
    search = PolicyHolderSearch.new(params[:s])
    @policy_holders = search.execute(page, per_page)
  end

  def new

  end

  def edit

  end

  def update

  end

  def create

  end

end