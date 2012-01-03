class PolicyHolder < ActiveRecord::Base
  has_one :person
  has_many :policies
  has_many :beneficiaries, :through => :policies
end