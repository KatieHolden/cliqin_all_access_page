class RemovePasswordDigestFromInstructors < ActiveRecord::Migration
  def up
    remove_column :instructors, :password_digest
  end

  def down
    add_column :instructors, :password_digest, :string
  end
end
