class RemoveIndexFromInstructorsTable < ActiveRecord::Migration
  def up
  	remove_index :instructors, :name => "index_instructors_on_remember_token"
  end

  def down
  end
end
