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
    user = User.new(email: "me@balling.com",first_name: "Tony", last_name: "Ramirez", current_club: "SJSC", postion: "striker")
    user.password = user.password_confirmation = "password"

    user.profile_name = "Space Town Bro"
    assert !user.save
    
    assert !user.errors[:profile_name].empty?
    assert !user.errors[:profile_name].include?("must be formatted correctly")
  end
  
  test "A user should have a correctly formatted name" do
    user = User.new(email: "me@balling.com",first_name: "Tony", last_name: "Ramirez", current_club: "SJSC", postion: "striker")
    user.password = user.password_confirmation = "password"
    user.profile_name = "tmacram1"
    assert user.valid?
  end
  
  
  
  
  
  
  
  
  
  
  
end
