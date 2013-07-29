class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :scheduled_date
      t.time :scheduled_time
      t.string :opponent
      t.text :location
      t.integer :user_id

      t.timestamps
    end

    add_index :games, :user_id
  end
end
