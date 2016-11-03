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
    # TODO: live send score to GUI
  end
end
