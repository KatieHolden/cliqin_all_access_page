class AddCourseNameColumnToStudentInCourses < ActiveRecord::Migration
  def change
    add_column :student_in_courses, :course_name, :string
  end
end
