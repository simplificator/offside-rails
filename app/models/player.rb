class Player < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end
end
