class InsuranceProductsController < ApplicationController

  def destroy
    product = InsuranceProduct.find(params[:id])
    product.destroy
    head :ok
  end

  def create
    product = InsuranceProduct.new(params[:insurance_product])
    product.policy_holder_id = params[:policy_holder_id]
    if product.save
      render :text => product.id
    else
      render :text => product.errors
    end
  end

  def update
    product = InsuranceProduct.find(params[:id])
    if product.update_attributes(params[:insurance_product])
      head :ok
    else
      render :text => product.errors
    end
  end

end