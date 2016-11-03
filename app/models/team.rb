class Team < ApplicationRecord
  has_many :team_members
  has_many :players, through: :team_members
  has_many :games
end
