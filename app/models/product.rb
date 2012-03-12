class Product < ActiveRecord::Base
  belongs_to :policy_holder
  validates_numericality_of :premium_amount
  validates_presence_of :cover, :premium_amount
  enum_attr :category, %w(maladie vie auto habitation voyage protection_revenue funerarie),
            :init => :maladie, :nil => false
end
