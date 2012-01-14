class User < ActiveRecord::Base
  acts_as_authentic
  has_many :policies
  enum_attr :status, %w(active blocked), :init => :active, :nil => false
  enum_attr :role, %w(agent administrator auditor), :init => :agent, :nil => false
end
