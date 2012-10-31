class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :answers
      t.integer :points
      t.integer :total_points
      t.date :class_date
      t.integer :student_ID
      t.integer :course_ID

      t.timestamps
    end
  end
end
