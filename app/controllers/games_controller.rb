class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @players = Player.all
  end

  def create
    players = player_ids.map { |player_id| Player.find(player_id) }
    render :new if players.count != 4

    team_red  = TeamCreationService.new(players[0], players[1]).call
    team_blue = TeamCreationService.new(players[2], players[3]).call

    @game = GameCreationService.new(team_red: team_red, team_blue: team_blue).call

    redirect_to live_path
  end

  def live
    @game = live_game
    redirect_to new_game_path unless @game.present?
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

  def final_whistle
    @game = live_game
    @game.final_whistle!
    redirect_to @game
  end

  private

  def live_game
    Game.live.first
  end

  def update_score_params
    params.permit(:team_color, :add_or_remove)
  end

  def form_params
    params.permit(:player_ids)
  end

  def selected_players
    params["sid"].split(' ').compact.map { |id| Player.find(id.to_i)}
  end

  def player_ids
    form_params[:player_ids].split(',')
  end
end
