class AddScheduledTimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :scheduled_time, :string
  end
end
