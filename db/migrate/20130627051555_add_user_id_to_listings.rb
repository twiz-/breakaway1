class AddUserIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :user_id, :integer
    add_index :listings, :user_id
    remove_column :listings, :name
  end
end
