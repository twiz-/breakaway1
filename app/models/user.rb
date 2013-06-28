class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
  :last_name,:current_club,:postion,:profile_name
  
  validates :first_name,:last_name,:profile_name,:current_club,:postion, presence: true
  
  validates :profile_name, uniqueness: true
  validates :profile_name, format: {
      with: /\A[a-zA-Z\-\_]+\Z/,
      message: "must be formatted correctly."
    }
  # attr_accessible :title, :body
  
  has_many :listings
  
  def full_name
    first_name + " " + last_name
  end
end
