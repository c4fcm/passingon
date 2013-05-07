require 'test_helper'

class ObituaryResponseTest < ActiveSupport::TestCase
   test "basic activesupport test" do
     assert_equal 1, obituary_responses(:one).obituary.id
   end
end

