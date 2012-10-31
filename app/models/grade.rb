# == Schema Information
#
# Table name: grades
#
#  id           :integer          not null, primary key
#  answers      :string(255)
#  points       :integer
#  total_points :integer
#  class_date   :date
#  student_ID   :integer
#  course_ID    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Grade < ActiveRecord::Base
  attr_accessible :answers, :class_date, :course_ID, :points, :student_ID, :total_points
end
