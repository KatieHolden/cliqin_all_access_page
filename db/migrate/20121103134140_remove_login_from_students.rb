class RemoveLoginFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :login
  end

  def down
    add_column :students, :login, :string
  end
end
