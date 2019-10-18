class User < ApplicationRecord
  has_secure_password

  has_many :events

  has_many :usertickets

  validates_presence_of  :username, :password
end
