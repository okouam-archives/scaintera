require 'enumerated_attribute'

class Beneficiary < ActiveRecord::Base
  belongs_to :policy_holder
  validates_presence_of :surname, :names, :relationship, :dob, :category

  enum_attr :category, %w(group_complete group_limited senior_group_complete senior_group_limited),
            :init => :group_complete, :nil => false do
              label group_complete: "Groupe - Garantie Complete"
              label group_limited: "Groupe - Garantie Limitee"
              label senior_group_complete: "Groupe Sagesse - Garantie Complete"
              label senior_group_limited: "Groupe Sagesse - Garantie Limitee"
  end

  def full_name
    names + " " + surname
  end

end