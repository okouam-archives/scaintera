class InsuranceProduct < ActiveRecord::Base
  belongs_to :policy_holder
end
