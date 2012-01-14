require 'enumerated_attribute'

class Policy < ActiveRecord::Base
  belongs_to :policy_holder
  acts_as_commentable
  accepts_nested_attributes_for :policy_holder
  belongs_to :user
  has_many :beneficiaries
  accepts_nested_attributes_for :beneficiaries, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :category, :status

  enum_attr :status, %w(active blocked), :init => :active, :nil => false

  enum_attr :category, %w(group_complete group_limited senior_group_complete senior_group_limited),
            :init => :group_complete, :nil => false do
              label group_complete: "Groupe - Garantie Complete"
              label group_limited: "Groupe - Garantie Limitee"
              label senior_group_complete: "Groupe Sagesse - Garantie Complete"
              label senior_group_limited: "Groupe Sagesse - Garantie Limitee"
            end
end
