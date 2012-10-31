# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  IP         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
