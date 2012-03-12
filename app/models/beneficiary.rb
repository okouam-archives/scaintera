require 'enumerated_attribute'

class Beneficiary < ActiveRecord::Base
  belongs_to :policy_holder
  validates_presence_of :surname, :names, :dob, :plan

  enum_attr :plan, %w(young_active young_semi_active senior_active senior_semi_active),
            :init => :young_active, :nil => false do
              label young_active: "Personne de 0 a 55, active"
              label young_semi_active: "Personne de 0 a 55, mi-active"
              label senior_active: "Personne de 56 a 70, active"
              label senior_semi_active: "Personne de 56 a 70, mi-active"
  end

  def full_name
    names + " " + surname
  end

end