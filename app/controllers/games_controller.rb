class GamesController < ApplicationController
  before_filter :load_game, only: [:show, :edit, :update, :destroy]
  before_filter :check_permission, only: [:edit, :update, :destroy]

  def new
    @game = current_user.games.new
  end

  def create
    @game = current_user.games.new(params[:game])
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @game.update_attributes(params[:game])
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @game.destroy
    redirect_to :back, notice: 'Game is successfully removed.'
  end

  private

  def load_game
      puts "ppppppppppppppppppppppp #{params[:id]}"
    @game = Game.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def check_permission
    handle_no_access if current_user != @game.user
  end
end
