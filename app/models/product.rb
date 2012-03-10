class Product < ActiveRecord::Base
  belongs_to :policy_holder
  validates_numericality_of :premium_amount
  validates_presence_of :cover, :premium_amount
end
