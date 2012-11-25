class StudentInCourse < ActiveRecord::Base
  attr_accessible :course_ID, :student_ID, :course_name

  def participated_today?(course_ID, student_ID)
  	grades = Grade.where(:course_ID => course_ID, :student_ID => student_ID, :class_date => Date.today)

  	grades.each do |g|
  		return true;
  	end
  	return false
  end
  
end
