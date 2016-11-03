require 'test_helper'

class GameCreationServiceTest < ActiveSupport::TestCase
  test 'same team cannot play against each other' do
    admin_core = teams(:admin_core)

    exception = assert_raise(RuntimeError) { GameCreationService.new(team_red: admin_core, team_blue: admin_core).call }
    assert_equal 'Teams cannot be the same', exception.message
  end

  test 'teams cannot contain same player(s)' do
    # alessandro is in both teams, it's impossible to play
    fritz_und_fraenzi = teams(:fritz_und_fraenzi)
    roadster = teams(:roadster)

    exception = assert_raise(RuntimeError) { GameCreationService.new(team_red: fritz_und_fraenzi, team_blue: roadster).call }
    assert_equal 'One player is in both teams', exception.message
  end

  test 'game is created correctly' do
    admin_core = teams(:admin_core)
    fritz_und_fraenzi = teams(:fritz_und_fraenzi)

    live_game = games(:roadster_vs_admin_live)

    assert_difference('Game.count') do
      GameCreationService.new(team_red: admin_core, team_blue: fritz_und_fraenzi).call
    end

    assert_not nil, live_game.ended_at
  end
end
