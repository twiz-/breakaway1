class DashboardController < ApplicationController
  def show
    if current_user.coach?
      @profiles = current_user.friends
    else
      @listings = current_user.listings
      @games = current_user.games
      @user_player = current_user
    end
  end
end
