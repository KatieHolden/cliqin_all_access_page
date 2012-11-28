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

  validates :course_name, :presence => true

  # checks to see is a student is has previously enrolled in a course
  def is_enrolled?(student_id, course_id)
  	student_in_courses = StudentInCourse.where(:student_ID => student_id)
  	student_in_courses.each do |c|
  		if c.course_ID == course_id
  			return true
  		end
  	end
  	return false
  end

  def populate_roster_row(student_ID, course_ID, class_date)
    grade = Grade.where(:student_ID => student_ID, :course_ID => course_ID, :class_date => class_date)
    
    grade.each do |g|
      return g.points
    end
    return 0

  end

  def populate_attendance(student_ID, course_ID, class_date)
    grade = Grade.where(:student_ID => student_ID, :course_ID => course_ID, :class_date => class_date)

    i = 0 
    grade.each do |g|
      while i < g.total_points
        if g.answers[i] != 'Z'
          return '@'
        end
      end
    end
    return 'x'

  end

  def answer_set_exists?(course_id)
    answer_set = Answer.where(:course_ID => course_id)
    return answer_set.size > 0
  end

  def answer_set_for_today?(course_id)
  	answer_set = Answer.where(:course_ID => course_id)

  	answer_set.each do |a|
  		if a.class_date == Time.now.in_time_zone("Eastern Time (US & Canada)").to_date
  			return true
  		end
  	end
  	return false
  end

  def answer_set_for_date?(course_id, date, answer_id)
    answer_set = Answer.where(:course_ID => course_id)

    answer_set.each do |a|
      if a.class_date == date && a.id != answer_id
        return true
      end
    end
    return false
  end
end
