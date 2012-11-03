class RemoveLoginFromInstructors < ActiveRecord::Migration
  def up
    remove_column :instructors, :login
  end

  def down
    add_column :instructors, :login, :string
  end
end
