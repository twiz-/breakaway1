require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)
  
  should "create a friendship that works" do
    assert_nothing_raised do 
      UserFriendship.create user: users(:tony), friend: users(:reggie)
    end
  end
end
