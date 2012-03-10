class BeneficiariesController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 15
  end

  def page
    params[:page] || 1
  end

  def index
    search = BeneficiarySearch.new(params[:s])
    @beneficiaries = search.execute(page, per_page, current_user)
  end

  def destroy
    Beneficiary.find(params[:id]).destroy
    head :ok
  end

  def show
    @policy_holder = PolicyHolder.find(params[:id])
  end

  def create
    beneficiary = Beneficiary.new(params[:beneficiary])
    beneficiary.policy_id = params[:policy_id]
    if beneficiary.save
      render :json => {id: beneficiary.id}
    else
      render :json => {errors: beneficiary.errors.full_messages}, :status => 500
    end
  end

  def update
    beneficiary = Beneficiary.find(params[:id])
    if beneficiary.update_attributes(params[:beneficiary])
      render :json => {}
    else
      render :json => {errors: beneficiary.errors.full_messages}, :status => 500
    end
  end

end