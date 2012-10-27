class Instructor < ActiveRecord::Base
  attr_accessible :IP_address, :login, :password
  has_many :courses
end
