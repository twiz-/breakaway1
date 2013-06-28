class RemovePlayerFromListings < ActiveRecord::Migration
  def change
      remove_column :listings, :player
  end
end
