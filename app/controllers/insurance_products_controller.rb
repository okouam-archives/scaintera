class InsuranceProductsController < ApplicationController

  def destroy
    product = InsuranceProduct.find(params[:id])
    product.destroy
    head :ok
  end

  def create

  end

  def update

  end

end