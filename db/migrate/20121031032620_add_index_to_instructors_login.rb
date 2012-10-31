class AddIndexToInstructorsLogin < ActiveRecord::Migration
  def change
  	add_index :instructors, :login, :unique => true
  end
end
