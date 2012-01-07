class PolicyHolder < ActiveRecord::Base
  acts_as_commentable
  validates_presence_of :dob, :first_name, :last_name, :title
  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address
  has_many :policies
  accepts_nested_attributes_for :policies
  belongs_to :user
  has_many :beneficiaries, :through => :policies
end