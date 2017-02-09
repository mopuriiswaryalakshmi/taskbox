require 'test_helper'

class LakshmiControllerTest < ActionController::TestCase
  test "should get hellow" do
    get :hellow
    assert_response :success
  end

end
