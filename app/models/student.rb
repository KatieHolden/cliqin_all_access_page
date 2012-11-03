# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation
  has_secure_password

  before_save { |student| student.login = login.downcase }

  validates :login, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }
  validates :password_confirmation, :presence => true

end
