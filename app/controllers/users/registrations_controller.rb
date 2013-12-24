class Users::RegistrationsController < Devise::RegistrationsController
  def players
    @user = User.new
  end
  def coaches
    @user = User.new
  end
end