require 'test_helper'

class Listados1ControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
