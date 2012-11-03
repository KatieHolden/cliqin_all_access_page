class AddHeirIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :heir_id, :integer
  end
end
