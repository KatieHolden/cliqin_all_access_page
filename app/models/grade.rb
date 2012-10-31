class Grade < ActiveRecord::Base
  attr_accessible :answers, :class_date, :course_ID, :points, :student_ID, :total_points
end
