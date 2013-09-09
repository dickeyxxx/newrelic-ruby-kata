require 'test_helper'

class CachingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "has correct values" do
    get :index
    values = assigns(:values)
    assert_in_delta(0.09983341664682817, values[0], 0.000001)
  end

end
