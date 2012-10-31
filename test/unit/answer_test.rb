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

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
