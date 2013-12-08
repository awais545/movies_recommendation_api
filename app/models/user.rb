class User < ActiveRecord::Base
	attr_accessible :email, :name

  has_many :likes

  email_regex = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  
  validates :email, format: { with: email_regex, message: "not a valid email" }, 
  					presence: true, uniqueness: true
end
