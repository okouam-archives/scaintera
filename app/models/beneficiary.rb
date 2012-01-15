class Beneficiary < ActiveRecord::Base
  belongs_to :policy
  has_one :policy_holder, through: :policy
  validates_presence_of :surname, :names, :relationship, :dob

  def full_name
    names + " " + surname
  end

end