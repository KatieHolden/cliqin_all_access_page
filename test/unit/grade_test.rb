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

require 'test_helper'

class GradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
