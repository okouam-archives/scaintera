class Beneficiary < ActiveRecord::Base
  has_one :person
  belongs_to :policy
end