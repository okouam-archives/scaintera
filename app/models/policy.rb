class Policy < ActiveRecord::Base
  belongs_to :policy_holder
  belongs_to :user
  has_many :beneficiaries
  validates_uniqueness_of :policy_number
  validates_presence_of :category, :status
end
