require 'test_helper'

class HellowControllerTest < ActionController::TestCase
  test "should get ishu" do
    get :ishu
    assert_response :success
  end

end
