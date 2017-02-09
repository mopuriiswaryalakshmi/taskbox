require 'test_helper'

class RailsControllerTest < ActionController::TestCase
  test "should get architecture" do
    get :architecture
    assert_response :success
  end

end
