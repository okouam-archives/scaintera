class PolicyHoldersController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 15
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
    @policy_holder = PolicyHolder.find(params[:id])
  end

  def update
    policy_holder = PolicyHolder.find(params[:id])
    if policy_holder.update_attributes(params[:policy_holder])
      flash[:message] = "The policy holder has been successfully updated."
      flash[:message_type] = "success"
    else
      flash[:message] = "Failure."
      flash[:message_type] = "failure"
    end
    redirect_to edit_policy_holder_path(params[:id])
  end

  def create

  end

end