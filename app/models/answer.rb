# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  class_date   :date
#  total_points :integer
#  answers      :string(255)
#  course_ID    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :answers, :class_date, :course_ID, :total_points

  def get_student_grade_for_date(student_ID, course_ID, class_date)
  	grades = Grade.where(:course_ID => course_ID, :student_ID => student_ID, :class_date => class_date)
  	grades.each do |g|
  		return g.points
  	end
  	return 0;

  end
end
