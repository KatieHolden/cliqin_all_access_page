class StudentInCourse < ActiveRecord::Base
  attr_accessible :course_ID, :student_ID, :course_name

  def participated_today?(course_ID, student_ID)
  	grades = Grade.where(:course_ID => course_ID, :student_ID => student_ID, 
  		:class_date => Time.now.in_time_zone("Eastern Time (US & Canada)").to_date)

  	grades.each do |g|
  		return true;
  	end
  	return false
  end
  
end
