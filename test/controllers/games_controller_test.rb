require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test 'redirect to new game when no live game' do
    live_game = games(:roadster_vs_admin_live)
    live_game.final_whistle!
    get live_path
    follow_redirect!
    assert_response :success
  end

  test 'no redirect when live game exists' do
    get live_path
    assert_response :success
  end
end
