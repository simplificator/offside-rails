class Game < ApplicationRecord
  belongs_to :team_red , class_name: 'Team'
  belongs_to :team_blue, class_name: 'Team'

  INFINITY = "timestamp '9999-12-31 23:59:59'".freeze

  MINIMUM_GOALS = 0
  MAXIMUM_GOALS = 8

  scope :live, -> {
    where("current_timestamp BETWEEN started_at AND coalesce(ended_at, #{INFINITY} )")
  }

  def update_score(team_color, delta)
    read_attr  = "#{team_color}_score"
    write_attr = "#{team_color}_score="
    new_score  = self[read_attr] + delta
    self.send(write_attr, new_score) if new_score.between?(MINIMUM_GOALS, MAXIMUM_GOALS)
    self
  end

  def final_whistle!
    self.update!(ended_at: Time.zone.now - 1.second)
  end

  def live?
    self.ended_at.nil?
  end
end
