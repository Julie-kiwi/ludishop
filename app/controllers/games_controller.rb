class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_game, only: [:destroy, :update, :edit, :show, :payment, :confirmed]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def index
    @games = Game.all
  end

  def show
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  def payment

  end

  def confirmed
    @user = User.find(@game.user_id)

  end

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :state, :price, :photo)
  end
end
