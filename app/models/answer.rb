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
end
