class BeneficiariesController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 5
  end

  def page
    params[:page] || 1
  end

  def index
    @beneficiaries = Beneficiary.paginate(per_page: per_page, page: page)
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