require 'test_helper'

class Sandbox1ControllerTest < ActionController::TestCase
  test "should get clients" do
    get :clients
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

end
