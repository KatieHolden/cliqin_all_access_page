class Course < ActiveRecord::Base
  attr_accessible :course_name, :instructor_id
  belongs_to :instructor
end
