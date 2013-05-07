require 'test_helper'

class ObituaryTest < ActiveSupport::TestCase
  test "obituary crowd status" do
    expected = {:read=>3, :nytimes_view=>1, :does_wikipedia_include=>0, 
                :wikipedia_needed=>1, :publications=>[],
                :id=>obituaries(:one).nyt_id}
    assert_equal expected, obituaries(:one).get_crowd_status
  end
end

