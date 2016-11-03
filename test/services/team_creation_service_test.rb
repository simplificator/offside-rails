require 'test_helper'

class TeamCreationServiceTest < ActiveSupport::TestCase
  test 'an existing team is not created again' do
    sabine = players(:sabine)
    alessandro = players(:alessandro)

    assert_no_difference('Team.count') do
      TeamCreationService.new(sabine, alessandro).call
    end

    # the sequence of players must not matter
    assert_no_difference('Team.count') do
      TeamCreationService.new(alessandro, sabine).call
    end
  end

  test 'a new team is created' do
    sabine = players(:sabine)
    mario = players(:mario)

    assert_difference('Team.count') do
      team = TeamCreationService.new(sabine, mario).call
      assert_equal 'Team Sabine Schäuble/Mario Super', team.name
    end
  end

  test 'a new team with custom name is created' do
    sabine = players(:sabine)
    florian = players(:florian)

    assert_difference('Team.count') do
      team = TeamCreationService.new(florian, sabine, team_name: 'Team Flobine').call
      assert_equal 'Team Flobine', team.name
    end
  end
end
