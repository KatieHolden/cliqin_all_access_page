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

  def has_courses?(instructor_ID)
    courses = Course.where(:instructor_ID => instructor_ID)
    return courses.size > 0
  end

  private

    def create_remember_token
      self.remember_token ||= SecureRandom.urlsafe_base64
    end

end

