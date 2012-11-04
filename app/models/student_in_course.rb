class StudentInCourse < ActiveRecord::Base
  attr_accessible :course_ID, :student_ID, :course_name
end
