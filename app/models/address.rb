class Address < ActiveRecord::Base
  belongs_to :addressable
  validates_presence_of :postcode, :postal_town, :address_line_1
end