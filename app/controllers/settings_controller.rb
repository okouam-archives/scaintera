class SettingsController < ApplicationController

  def index
    @pricing = {}
    if Price.all.count < 1
      @pricing = {
        :young_active => {joining_fee: 0, premium: 0},
        :senior_active => {joining_fee: 0, premium: 0},
        :senior_semi_active => {joining_fee: 0, premium: 0},
        :young_semi_active => {joining_fee: 0, premium: 0},
      }
    else
      Price.all.each do |pricing|
        @pricing[pricing.plan.to_sym] = {joining_fee: pricing.joining_fee, premium: pricing.premium}
      end
    end
  end

  def reset
    Comment.delete_all
    Product.delete_all
    Beneficiary.delete_all
    PolicyHolder.delete_all
    redirect_to settings_path
  end

  def prices
    pricing = params[:pricing]
    pricing.each_pair do |plan, prices|
      setting = Price.find_by_plan(plan)
      setting = Price.new(:plan => plan) unless setting
      setting.joining_fee = prices[:joining_fee]
      setting.premium = prices[:premium]
      setting.save!
    end
    redirect_to settings_path
  end

end