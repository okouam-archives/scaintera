class PolicyHoldersController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 15
  end

  def page
    params[:page] || 1
  end

  def index
    search = PolicyHolderSearch.new(params[:s])
    @policy_holders = search.execute(page, per_page, current_user)
  end

  def new
    @policy_holder = PolicyHolder.new
    @policy_holder.user = current_user
  end

  def comments
    @policy_holder = PolicyHolder.find(params[:id])
    @comment = @policy_holder.comments.build
  end

  def edit
    @policy_holder = PolicyHolder.find(params[:id])
  end

  def update
    policy_holder = PolicyHolder.find(params[:id])
    if policy_holder.update_attributes(params[:policy_holder])
      flash[:message] = ["The policy holder has been successfully updated."]
      flash[:message_type] = :notifications
    else
      flash[:message] = policy_holder.errors.full_messages
      flash[:message_type] = :errors
    end
    redirect_to edit_policy_holder_path(params[:id])
  end

  def create
    @policy_holder = PolicyHolder.new(params[:policy_holder])
    @policy_holder.user = current_user
    if @policy_holder.save
      flash[:message] = ["The policy has been successfully created."]
      flash[:message_type] = :notifications
      redirect_to edit_policy_holder_path(@policy_holder.id)
    else
      flash[:message] = @policy_holder.errors.full_messages
      flash[:message_type] = :errors
      render :new
    end
  end

end