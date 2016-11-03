class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @selected_players = Player.none
    @players = Player.all
  end

  def live
    @game = live_game
  end

  def update_score
    team_color = update_score_params[:team_color]
    action = update_score_params[:add_or_remove]
    LiveGameService.new(team_color).add_goal     if action == 'add'
    LiveGameService.new(team_color).remove_goal  if action == 'remove'
    redirect_to live_path
  end

  def add_player
    @selected_players =  selected_players + [Player.find(params["pid"])]
    @players = Player.all - @selected_players
  end

  def remove_player
    @selected_players =  selected_players - [Player.find(params["pid"])]
    @players = Player.all - @selected_players
  end

  private

  def live_game
    Game.live.first
  end

  def update_score_params
    params.permit(:team_color, :add_or_remove)
  end

  def selected_players
    params["sid"].split(' ').compact.map { |id| Player.find(id.to_i)}
  end
end
