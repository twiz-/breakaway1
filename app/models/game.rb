class Game < ActiveRecord::Base
  attr_accessible :location, :opponent, :scheduled_date, :scheduled_time
  validates :location, :opponent, :scheduled_date, :scheduled_time, presence: true

  belongs_to :user
end
