require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'there is one live game' do
    assert_equal 1, Game.live.count
  end

  test 'live game can be ended' do
    live_game = games(:roadster_vs_admin_live)
    assert_difference('Game.live.count', -1) do
      live_game.final_whistle!
    end
  end
end
