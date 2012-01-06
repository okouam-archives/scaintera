class PolicyHolder < ActiveRecord::Base
  has_one :address
  has_many :policies
  belongs_to :user
  has_many :beneficiaries, :through => :policies
end