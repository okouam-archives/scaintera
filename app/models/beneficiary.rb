class Beneficiary < ActiveRecord::Base
  belongs_to :policy
  has_one :policy_holder, through: :policy

  def full_name
    names + " " + surname
  end

end