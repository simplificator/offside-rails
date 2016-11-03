class TeamCreationService
  def initialize(player_a, player_b, options = {})
    @player_a = player_a
    @player_b = player_b
    @options = options
  end

  def call
    grouped_teams = TeamMember.where(player: players).group(:team_id).count
    team_id_including_both_players = grouped_teams&.find { |_k, v| v == 2 }&.first

    return Team.find(team_id_including_both_players) if team_id_including_both_players.present?

    create_new_team
  end

  private

  def players
    [@player_a, @player_b]
  end

  def create_new_team
    Team.transaction do
      new_team = Team.new(name: team_name)
      players.each do |player|
        new_team.team_members.new(player: player)
      end
      new_team.save!
      new_team
    end
  end

  def team_name
    @options.dig(:team_name) || default_team_name
  end

  def default_team_name
    "Team #{ players.map(&:full_name).join('/') }"
  end
end
