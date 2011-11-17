class User < ActiveRecord::Base
  has_many :orders
  validates_presence_of :name, :email, :password
  
  acts_as_authentic do |c|
    c.login_field :email
    c.validate_login_field false
  end 
end
