class PoliciesController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 5
  end

  def page
    params[:page] || 1
  end

  def index
    @policies = Policy.paginate(per_page: per_page, page: page)
  end

  def new
    @policy = Policy.new({user: current_user})
    policy_holder = @policy.build_policy_holder
    policy_holder.build_address
  end

  def show
    @policy = Policy.find(params[:id])
  end

  def comments
    @policy = Policy.find(params[:id])
  end

  def beneficiaries
    @policy = Policy.find(params[:id])
  end

  def policy_holder
    @policy = Policy.find(params[:id])
  end

  def update

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