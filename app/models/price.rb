class Price < ActiveRecord::Base
  validates_presence_of :plan, :joining_fee, :premium
end
