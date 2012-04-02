class CalculatorsController < ApplicationController

  def show
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

end