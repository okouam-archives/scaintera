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

  end

end