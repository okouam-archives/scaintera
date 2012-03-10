class ProductsController < ApplicationController

  def show
    @policy_holder = PolicyHolder.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    head :ok
  end

  def create
    product = Product.new(params[:insurance_product])
    product.policy_holder_id = params[:policy_holder_id]
    if product.save
      render :json => {id: product.id}
    else
      render :json => {errors: product.errors.full_messages}, :status => 500
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update_attributes(params[:insurance_product])
      render :json => {}
    else
      render :json => {errors: product.errors.full_messages}, :status => 500
    end
  end


end