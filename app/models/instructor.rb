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
  acts_as_heir_of :user
  attr_accessible :login, :IP, :password, :password_confirmation
  has_secure_password

  before_save { |instructor| instructor.login = login.downcase }
  before_save :create_remember_token

  validates :login, :presence => true #, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :length => { :minimum => 6 }, :on => :create
  validates :password_confirmation, :presence => true, :on => :create

  private

    def create_remember_token
      self.remember_token ||= SecureRandom.urlsafe_base64
    end

end

