require 'test_helper'

class TopicTest < ActiveSupport::TestCase
   test "fetch_obituaries" do
     assert_equal 2, topics(:politics).all_obituaries.size
     assert_equal 2, topics(:religion).all_obituaries.size
   end
end

