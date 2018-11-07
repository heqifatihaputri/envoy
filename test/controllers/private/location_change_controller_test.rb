require 'test_helper'

class Private::LocationChangeControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get private_location_change_create_url
    assert_response :success
  end

end
