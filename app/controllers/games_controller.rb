class GamesController < ApplicationController
  def index
    @games = Game.all.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @questions = @game.questions.page(params[:page])
  end
end