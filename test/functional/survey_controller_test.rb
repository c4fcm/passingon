require 'test_helper'

class SurveyControllerTest < ActionController::TestCase
  test "read" do
    get :read, {:topic=>topics(:politics).name, :obituary_id=>"abcd1234"}
    assert_equal "abcd1234", assigns(:obit_response).obituary.nyt_id
  end
end
