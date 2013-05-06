require 'test_helper'

class ObituaryControllerTest < ActionController::TestCase
  test "crowd status" do
    get :crowd_status, {:id=>obituaries(:one).nyt_id}, :format=>'json'
    expected = {"read"=>3, "nytimes_view" =>1, "does_wikipedia_include" => 0,
                "wikipedia_needed"=>1, "publications"=>[],
                "id"=>obituaries(:one).nyt_id}
    assert_equal expected, assigns[:crowd_status]
  end
end
