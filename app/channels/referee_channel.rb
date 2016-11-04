class RefereeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "referee_channel"
  end

  def unsubscribed
  end

  def update_score(data)
    team_color  = data['team_color']
    action      = data['add_or_remove']
    LiveGameService.new(team_color).add_goal    if action == 'add'
    LiveGameService.new(team_color).remove_goal if action == 'remove'
  end

end
