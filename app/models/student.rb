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
  acts_as_heir_of :user 
  attr_accessible :login, :password, :password_confirmation
  has_secure_password

  before_save { |student| student.login = login.downcase }
  before_save :create_remember_token

  def has_courses(student_ID)
    courses = StudentInCourse.where(:student_ID => student_ID)
    return courses.size > 0
  end

  private

    def create_remember_token
      self.remember_token ||= SecureRandom.urlsafe_base64
    end

end
