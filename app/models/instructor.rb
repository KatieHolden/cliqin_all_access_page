# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  IP         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instructor < ActiveRecord::Base
  attr_accessible :IP, :login

  before_save { |instructor| instructor.login = login.downcase }

  validates :login, :presence => true, :uniqueness => { :case_sensitive => false }
end
