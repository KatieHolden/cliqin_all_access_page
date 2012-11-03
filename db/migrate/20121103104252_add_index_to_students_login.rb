class AddIndexToStudentsLogin < ActiveRecord::Migration
  def change
  	add_index :students, :login, unique: true
  end
end
