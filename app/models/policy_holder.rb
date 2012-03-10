require 'enumerated_attribute'

class PolicyHolder < ActiveRecord::Base
  acts_as_commentable
  validates_presence_of :dob, :names, :gender, :surname, :nationality, :address, :city, :postcode, :email, :status, :on => :update
  has_many :beneficiaries
  enum_attr :status, %w(active blocked), :init => :active, :nil => false
  accepts_nested_attributes_for :beneficiaries, :reject_if => :all_blank, :allow_destroy => true
  acts_as_commentable
  belongs_to :user
  has_many :products
  enum_attr :gender, %w(male female), :init => :male, :nil => false
end