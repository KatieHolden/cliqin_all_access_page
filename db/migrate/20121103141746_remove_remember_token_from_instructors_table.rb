class RemoveRememberTokenFromInstructorsTable < ActiveRecord::Migration
  def up
    remove_column :instructors, :remember_token
  end

  def down
    add_column :instructors, :remember_token, :string
  end
end
