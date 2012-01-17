class PoliciesController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 15
  end

  def page
    params[:page] || 1
  end

  def index
    search = PolicySearch.new(params[:s])
    @policies = search.execute(page, per_page, current_user)
  end

  def new
    @policy = Policy.new({user: current_user})
    if policy_holder_id = params[:policy_holder_id]
      @policy.policy_holder = PolicyHolder.find(policy_holder_id)
    else
      @policy.build_policy_holder
    end
  end

  def show
    @policy = Policy.find(params[:id])
  end

  def comments
    @policy = Policy.find(params[:id])
    @comment = @policy.comments.build
  end

  def beneficiaries
    @policy = Policy.find(params[:id])
  end

  def policy_holder
    @policy = Policy.find(params[:id])
  end

  def update
    policy = Policy.find(params[:id])
    if policy.update_attributes(params[:policy])
      flash[:message] = "The policy has been successfully updated."
      flash[:message_type] = "success"
    else
      flash[:message] = "Failure."
      flash[:message_type] = "failure"
    end
    if params[:page] == "beneficiaries"
      policy.beneficiaries.build
      redirect_to policy_beneficiaries_path(params[:id])
    else
      redirect_to policy_path(params[:id])
    end
  end

  def create
    policy = Policy.new(params[:policy])
    if policy.save
      redirect_to policy_path(policy.id)
    else
      @policy = policy
      render :new
    end
  end

end