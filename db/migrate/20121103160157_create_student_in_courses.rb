class CreateStudentInCourses < ActiveRecord::Migration
  def change
    create_table :student_in_courses do |t|
      t.integer :student_ID
      t.integer :course_ID

      t.timestamps
    end
  end
end
