class Game < ActiveRecord::Base
  attr_accessible :location, :opponent, :scheduled_date, :scheduled_time
  validates :location, :opponent, :scheduled_date, :scheduled_time, presence: true

  belongs_to :user
  
  def self.to_csv(games)
    CSV.generate do |csv|
      csv << column_names
      games.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
