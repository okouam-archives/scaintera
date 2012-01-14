require 'enumerated_attribute'

class PolicyHolder < ActiveRecord::Base
  acts_as_commentable
  validates_presence_of :dob, :names, :gender, :surname, :nationality, :address, :city, :postcode, :email
  has_many :policies
  acts_as_commentable
  accepts_nested_attributes_for :policies
  belongs_to :user
  has_many :insurance_products
  enum_attr :gender, %w(male female), :init => :male, :nil => false
  has_many :beneficiaries, :through => :policies
end