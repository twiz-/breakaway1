class ProfilesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @search = User.players.search(params[:q])
    @profiles = @search.result
  end

  def show
    @user = User.find_by_profile_name(params[:id])

    if @user
      @listings = @user.listings
      @games = @user.games
      respond_to do |format|
        format.html
        format.csv {send_data Game.to_csv(@games)}
      end
      return
      render action: :show
    else
      render file: "public/404", status: 404, formats: [:html]
    end
  end
end
