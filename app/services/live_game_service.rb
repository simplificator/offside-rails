class LiveGameService
  def initialize(team_color)
    @live_game = Game.live.first
    @team_color = team_color.to_s
    raise 'There is no live game' unless @live_game.present?
  end

  def add_goal
    Game.transaction do
      @live_game.update_score(@team_color, 1).save!
    end
    publish_score
  end

  def remove_goal
    Game.transaction do
      @live_game.update_score(@team_color, -1).save!
    end
    publish_score
  end

  private

  def publish_score
    ActionCable.server.broadcast "referee_channel", current_scores
  end

  def current_scores
    {
      scores: {
        team_blue: @live_game.team_blue_score,
        team_red: @live_game.team_red_score
      }
    }
  end
end
