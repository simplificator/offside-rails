class GameCreationService
  def initialize(options = {})
    @team_red, @team_blue = options.values_at(:team_red, :team_blue)
    raise 'Teams cannot be the same'      if @team_red == @team_blue
    raise 'One player is in both teams'   if duplicate_players?(@team_red, @team_blue)
  end

  def call
    terminate_old_games
    Game.create(team_red: @team_red, team_blue: @team_blue)
  end

  private

  def terminate_old_games
    Game.all.update_all(ended_at: Time.zone.now)
  end

  def duplicate_players?(team_red, team_blue)
    (team_red.players.collect { |p| p.id } |
    team_blue.players.collect { |p| p.id }).count < 4
  end
end
