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

  def show
    @policy = Policy.find(params[:id])
  end

end