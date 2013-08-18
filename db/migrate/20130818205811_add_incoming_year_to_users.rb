class AddIncomingYearToUsers < ActiveRecord::Migration
  def change
    add_column :users, :incoming_year, :string, default: "#{Time.now.year + 2}"
  end
end
