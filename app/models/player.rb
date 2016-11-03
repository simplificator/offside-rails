class Player < ApplicationRecord
  has_many :team_members
  has_many :teams, through: :team_members


  def full_name
    "#{first_name} #{last_name}"
  end
end
