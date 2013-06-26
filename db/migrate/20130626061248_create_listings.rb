class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :player
      t.string :video
      t.text :description

      t.timestamps
    end
  end
end
