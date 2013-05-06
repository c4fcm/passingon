require 'test_helper'

class TopicControllerTest < ActionController::TestCase
  test "crowd status" do
    get :crowd_statuses, {:id=>topics(:politics).name}, :format=>'json'
    assert_equal 2, assigns[:crowd_statuses].size
    expected = {"read"=>3, "nytimes_view" =>1, "does_wikipedia_include" => 0,
                "wikipedia_needed"=>1, "publications"=>[],
                "id"=>obituaries(:one).nyt_id}
    assert_equal expected, assigns[:crowd_statuses][0]

  end
end
