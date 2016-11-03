class Game < ApplicationRecord
  belongs_to :team_red , class_name: 'Team'
  belongs_to :team_blue, class_name: 'Team'

  INFINITY = "timestamp '9999-12-31 23:59:59'".freeze

  scope :live, -> {
    where("current_timestamp BETWEEN started_at AND coalesce(ended_at, #{INFINITY} )")
  }

  def final_whistle!
    self.update!(ended_at: Time.zone.now - 1.second)
  end
end
