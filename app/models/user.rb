class User < ActiveRecord::Base
  acts_as_authentic
  has_many :policies

end
