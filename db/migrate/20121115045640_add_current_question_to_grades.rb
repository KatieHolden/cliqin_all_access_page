class AddCurrentQuestionToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :current_question, :integer
  end
end
