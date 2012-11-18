# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  course_name   :string(255)
#  instructor_ID :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :course_name, :instructor_ID, :active

  validates :course_name, :presence => true

  # checks to see is a student is has previously enrolled in a course
  def is_enrolled?(student_id, course_name)
  	student_in_courses = StudentInCourse.where(:student_id => student_id)
  	student_in_courses.each do |c|
  		if c.course_name == course_name
  			return true
  		end
  	end
  	return false
  end

  def answer_set_for_today?(course_id)
  	answer_set = Answer.where(:course_id => course_id)

  	answer_set.each do |a|
  		if a.class_date == Date.today
  			return true
  		end
  	end
  	return false
  end
end
