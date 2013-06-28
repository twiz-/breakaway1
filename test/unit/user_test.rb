require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "A user should input a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  test "A user should input position" do
    user = User.new
    assert !user.save
    assert !user.errors[:postion].empty?
  end
  test "A user should input a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  test "A user should input a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  test "A user should input a current club" do
    user = User.new
    assert !user.save
    assert !user.errors[:current_club].empty?
  end
  test "A user should have a unique user name" do
    user = User.new
    user.profile_name = users(:tony).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  test "A user should have a porfile name without spaces" do
    user = User.new
    user.profile_name = "Space Town Bro"
    assert !user.save
    
    assert !user.errors[:profile_name].empty?
    assert !user.errors[:profile_name].include?("must be formatted correctly")
  end
end
