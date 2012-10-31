class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.date :class_date
      t.integer :total_points
      t.string :answers
      t.integer :course_ID

      t.timestamps
    end
  end
end
