# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  course_name   :string(255)
#  instructor_ID :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :course_name, :instructor_ID, :active
end
