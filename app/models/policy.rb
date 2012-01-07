class Policy < ActiveRecord::Base
  belongs_to :policy_holder
  acts_as_commentable
  accepts_nested_attributes_for :policy_holder
  belongs_to :user
  has_many :beneficiaries
  accepts_nested_attributes_for :beneficiaries
  validates_uniqueness_of :policy_number
  validates_presence_of :category, :status, :policy_number
end
