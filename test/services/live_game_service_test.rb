require 'test_helper'

class LiveGameServiceTest < ActiveSupport::TestCase
  test 'team red scores a goal' do
    assert_difference('live_game.team_red_score', 1) do
      LiveGameService.new(:team_red).add_goal
      live_game.reload
    end
  end

  test 'team blue scores a goal' do
    assert_difference('live_game.team_blue_score', 1) do
      LiveGameService.new(:team_blue).add_goal
      live_game.reload
    end
  end

  test 'team red loses a goal' do
    assert_difference('live_game.team_red_score', -1) do
      LiveGameService.new(:team_red).remove_goal
      live_game.reload
    end
  end

  test 'team blue loses a goal' do
    assert_difference('live_game.team_blue_score', -1) do
      LiveGameService.new(:team_blue).remove_goal
      live_game.reload
    end
  end

  test 'team score cannot be lower than 0' do
    assert_equal 1, live_game.team_blue_score

    2.times do
      LiveGameService.new(:team_blue).remove_goal
    end

    live_game.reload

    assert_equal 0, live_game.team_blue_score
  end

  test 'team score cannot be higher than 8' do
    assert_equal 2, live_game.team_red_score

    8.times do
      LiveGameService.new(:team_red).add_goal
    end

    live_game.reload

    assert_equal 8, live_game.team_red_score
  end

  private

  def live_game
    games(:roadster_vs_admin_live)
  end
end
