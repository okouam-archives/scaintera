class Beneficiary < ActiveRecord::Base
  has_one :address
  belongs_to :policy
  has_one :policy_holder, through: :policy
end