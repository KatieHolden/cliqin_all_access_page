class AddHeirTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :heir_type, :string
  end
end
