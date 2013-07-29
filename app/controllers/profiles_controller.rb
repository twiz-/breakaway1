class ProfilesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @profiles = User.players
  end

  def show
    @user = User.find_by_profile_name(params[:id])

    if @user
      @listings = @user.listings
      @games = @user.games

      render action: :show
    else
      render file: "public/404", status: 404, formats: [:html]
    end
  end
end
