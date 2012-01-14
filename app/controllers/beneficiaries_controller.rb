class BeneficiariesController < ApplicationController

  def per_page
    @per_page = params[:per_page] || 15
  end

  def page
    params[:page] || 1
  end

  def index
    search = BeneficiarySearch.new(params[:s])
    @beneficiaries = search.execute(page, per_page)
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