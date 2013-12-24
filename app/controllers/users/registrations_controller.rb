class Users::RegistrationsController < Devise::RegistrationsController
  def players
    @user = User.new
  end
  def coaches
    @listings = Listing.order("created_at DESC").limit(4)
    @user = User.new
  end
end