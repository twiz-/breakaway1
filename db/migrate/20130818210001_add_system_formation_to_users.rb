class AddSystemFormationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :system_formation, :string, default: "4-3-3"
  end
end
