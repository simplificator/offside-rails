require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'coming soon is displayed' do
    get root_path
    assert_response :success
  end
end
