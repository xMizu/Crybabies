require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Should show user" do 
    
    x = User.all.length

    assert_equal 2,x,"User creation works"
    User.destroy_all
  end

end
