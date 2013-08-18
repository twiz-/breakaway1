class RemoveScheduledTimeFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :scheduled_time
  end

  def down
    add_column :games, :scheduled_time, :time
  end
end
