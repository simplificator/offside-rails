class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def live
    @game = live_game
  end

  def update_score
    team_color = game_params[:team_color]
    action = game_params[:add_or_remove]
    LiveGameService.new(team_color).add_goal     if action == 'add'
    LiveGameService.new(team_color).remove_goal  if action == 'remove'
    redirect_to live_path
  end

  private

  def live_game
    Game.live.first
  end

  def game_params
    params.permit(:id, :team_color, :add_or_remove)
  end
end
