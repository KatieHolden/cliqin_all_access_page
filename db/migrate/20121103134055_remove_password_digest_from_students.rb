class RemovePasswordDigestFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :password_digest
  end

  def down
    add_column :students, :password_digest, :string
  end
end
