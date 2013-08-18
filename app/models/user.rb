class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
  :last_name, :current_club, :postion, :profile_name, :user_type, :incoming_year,:system_formation

  validates :first_name, :last_name, :profile_name, :current_club, :postion, presence: true

  validates :profile_name, uniqueness: true
  validates :profile_name, format: {
      with: /^[a-zA-Z0-9_-]+$/,
      message: "must be formatted correctly."
    }
  # attr_accessible :title, :body
  scope :players, where(:user_type => 'player')

  has_many :listings
  has_many :user_friendships
  has_many :friends, through: :user_friendships
  has_many :games

  def full_name
    first_name + " " + last_name
  end

  def to_param
    profile_name
  end

  def coach?
    user_type == 'coach'
  end

  def in_favorites?(player)
    friends.include?(player)
  end
end
